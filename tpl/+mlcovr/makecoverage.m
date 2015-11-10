%MAKECOVERAGE creates a structure that can be used to generate coverage rpts
% 
% 
%   See also COVERAGERPTXML, GETMFILELIST, PROFILE
%
%  The MLCOVR package is part of FAST
%  FAST: A Framework for Agile Software Development
%  Copyright (c) 2008-2009 Sandia Corporation.	
%   This software is distributed under the BSD License.	
%  Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,	
%  the U.S. Government retains certain rights in this software.	

%   Redistribution and use in source and binary forms, with or without
%   modification, are permitted provided that the following conditions are
%   met: 
%
%     * Redistributions of source code must retain the above copyright
%     notice, this list of conditions and the following disclaimer.
%
%     * Redistributions in binary form must reproduce the above copyright
%     notice, this list of conditions and the following disclaimer in the
%     documentation and/or other materials provided with the distribution. 
%
%     * Neither the name of the Sandia Corporation nor the names of its
%     contributors may be used to endorse or promote products derived from
%     this software without specific prior written permission.
%
%   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
%   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
%   TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
%   PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
%   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
%   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
%   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
%   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
%   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
%   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
%   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

% Changelog:
%
%   2009-Aug-10, David Hart, SNL
%       Original checkin.
%
%
function packages = makecoverage( dirname , mFiles , profName )
  if nargin > 2,
    P = load(profName,'-MAT');
    profInfo = P.profInfo;
  else
    profInfo = profile('info');
  end
  
  profiledFileList = {profInfo.FunctionTable.FileName};
  profiledFileIdxs = strmatch(dirname,profiledFileList);
  profiledFileList = profiledFileList(profiledFileIdxs);
  
  if nargin < 2 || isempty(mFiles)
    mFiles = mlcovr.getmfilelist(dirname,'',{});
  end

  sourceFileList = {mFiles.filename};
  for i = 1:length(profiledFileList)
    profIdx = profiledFileIdxs(i);
    fileIdx = strmatch(profiledFileList{i},sourceFileList);
    if isempty(fileIdx),
      continue;
    end
    mthdIdx = strmatch(profInfo.FunctionTable(profIdx).FunctionName,{mFiles(fileIdx).Methods.fullname});
    lineIds = profInfo.FunctionTable(profIdx).ExecutedLines(:,1);
    lineCts = profInfo.FunctionTable(profIdx).ExecutedLines(:,2);
    lineDur = profInfo.FunctionTable(profIdx).ExecutedLines(:,3);
    mFiles(fileIdx).Source.hits(lineIds) = mFiles(fileIdx).Source.hits(lineIds) + lineCts;
    mFiles(fileIdx).Source.time(lineIds) = mFiles(fileIdx).Source.time(lineIds) + lineDur;
  end
  
  packages = struct('name','','Classes',[],'branchrate',0.0,'complexity',0,'linerate',0.0);
  lastpackage = '';
  packageCt = 0;
  packlines = 0;
  packlinesRan = 0;
  packbranches = 0;
  packbranchesSplit = 0;
  for i = 1:length(mFiles)
    runnable = sum(mFiles(i).runnable>0);
    if runnable == 0,
      continue;
    end
    ran = sum(mFiles(i).Source.hits>0);
    mFiles(i).linerate = ran / runnable;
    branchable = sum(mFiles(i).Source.isBranch);
    if branchable == 0,
      mFiles(i).branchrate = 0;
      branched = 0;
    else
      branchable = 0;
      branched = 0;
      for j = 1:length(mFiles(i).Methods)
        methMask = mFiles(i).Methods(j).linemask;
        methRuns = sum((mFiles(i).runnable & methMask)>0);
        if methRuns == 0,
          continue;
        end
        methTime = nansum(mFiles(i).Source.time(methMask));
        mFiles(i).Source.time(methMask) = mFiles(i).Source.time(methMask) ./ methTime;
        methRan = sum(mFiles(i).Source.hits(methMask)>0);
        mFiles(i).Methods(j).linerate = methRan / methRuns;
        methBranches = sum(mFiles(i).Source.isBranch & methMask > 0);
        if methBranches == 0,
          mFiles(i).Methods(j).branchrate = 0;
          methBranched = 0;
        else
          methBranches = 0;
          methBranched = 0;
          branchIds = find(mFiles(i).Source.isBranch & methMask );
          for L = 1:length(branchIds)
            branches = mFiles(i).Source.branches{branchIds(L)};
            condSatis = sum(mFiles(i).Source.hits(branches) > 0);
            if isempty(condSatis),
              condSatis = 0;
            end
            condExist = length(branches);
            methBranched = methBranched + sum(mFiles(i).Source.hits(branches) > 0);
            methBranches = methBranches + condExist;
            mFiles(i).Source.condCovr{branchIds(L)} = sprintf('%d%% (%d/%d)',...
              round(100*(condSatis/condExist)),round(condSatis),round(condExist));
          end
          mFiles(i).Methods(j).branchrate = methBranched / methBranches;
        end
        branched = branched + methBranched;
        branchable = branchable + methBranches;
      end
      mFiles(i).branchrate = branched / branchable;
    end
    
    
    if ~strcmp(mFiles(i).package,lastpackage)
      packlines = runnable;
      packlinesRan = ran;
      packbranches = branchable;
      packbranchesSplit = branched;
      packageCt = packageCt + 1;
      lastpackage = mFiles(i).package;
      packages(packageCt).name = lastpackage;
      packages(packageCt).Classes = mFiles(i);
      packages(packageCt).branchrate = packbranchesSplit / packbranches;
      packages(packageCt).linerate = packlinesRan / packlines;
      packages(packageCt).complexity = mFiles(i).complexity;
    else
      packages(packageCt).Classes(end+1) = mFiles(i);
      packlines = packlines + runnable;
      packlinesRan = packlinesRan + ran;
      packbranches = packbranches + branchable;
      packbranchesSplit = packbranchesSplit + branched;
      packages(packageCt).branchrate = packbranchesSplit / packbranches;
      packages(packageCt).linerate = packlinesRan / packlines;
      packages(packageCt).complexity = packages(packageCt).complexity + mFiles(i).complexity;
    end
  end
end
