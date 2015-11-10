%GETMFILELIST compiles a list of the m-files that are included in a pkg
%  The GETMFILELIST function returns an array of structures that contain
%  line and branch information about the m-files in a specified directory
%  The base_package argument allows for proper classification of sub-
%  packages. The omit_files argument is a cell array that lists files or
%  directories to strip out of the search.
%
% Usage:
%    mFiles = getmfilelist( base_directory , base_package , omit_files )
%
% See also COVERAGERPTXML, MAKECOVERAGE, PROFILE
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
%

% Changelog:
%
%   2009-Aug-10, David Hart, SNL
%       Original checkin.
%
%
function mFiles = getmfilelist( base_directory , base_package , omit_files )
  if nargin < 3,
    omit_files = {};
  end
  if nargin<2,
    base_package = '';
  end
  fs = filesep;
  mFiles = struct('filename','','package','','name','','Source',{},...
    'Methods',[],'runnable',[],'linerate',0,'branchrate',0,'complexity',0,...
    'isClassDef',false);
  myFiles = dir([base_directory fs '*.m']);
  if length(myFiles) < 1,
    mFiles = [];
    return;
  end
  n = 0;
  for kk = 1:length(myFiles)
    omitme = false;
    for i = 1:length(omit_files)
      matchd = strmatch(omit_files{i},myFiles(kk).name);
      if ~isempty(matchd)
        omitme = true;
      end
    end
    if omitme,
      continue;
    end
    n = n + 1;
    mFiles(n).filename = fullfile(base_directory,myFiles(kk).name);
    [ path, name ] = fileparts(mFiles(n).filename);
    if isempty(base_package),
      mFiles(n).package = 'base';
    else
      mFiles(n).package = base_package;
    end
    mFiles(n).name = name;
    D = dir(mFiles(n).filename);
    bufferSize = max(100,D.bytes);
    fid = fopen(mFiles(n).filename,'r');
    if fid < 0,
      warning('FAST:MLCOVR:getmfilelist',...
        'Unable to read file %s',mFiles(n).filename);
      continue;
    end
    txt = textscan(fid,'%s','delimiter','\n','whitespace','','bufSize',bufferSize);
    fclose(fid);
    code = strtrim(txt{1});
    ClassDef = strmatch('classdef',code);
    if ~isempty(ClassDef),
      mFiles(n).isClassDef = true;
    end
    Methods = getcallinfo(mFiles(n).filename,'normal',code);
    runnableLineIndex = callstats('file_lines',mFiles(n).filename);
    mFiles(n).runnable = false(size(code));
    mFiles(n).runnable(runnableLineIndex) = true;
    scope = mFiles(n).runnable .* 0;
    condCovr = cell(size(scope));
    branches = cell(size(scope));
    isBranch = false(size(scope));
    isMethod = false(size(scope));
    hits = zeros(size(scope));
    time = zeros(size(scope));
    mFiles(n).Methods = struct('type','','name','','fullname','','firstline',0,'lastline',0,'linemask',[],'calls',[],'calllines',[],'linerate',0,'branchrate',0);
    for m = 1:length(Methods);
      % For each function or subfunction (class method) create a level
      % mapping and parse all the different branches out
      level = 1;
      fallback = Methods(m).firstline;
      isMethod(fallback) = true;
      setCondition = false;
      complexity = 1;
      for i = Methods(m).firstline:Methods(m).lastline

        if mFiles(n).runnable(i)
          line = code(i);
          scope(i) = level;
          pat = '(\(.*\))|(\{.*\})|(\[.*\])';
          hasString = regexp(line,pat,'once');
          while ~isempty(hasString{:})
            line = regexprep(line,pat,'');
            hasString = regexp(line,pat,'once');
          end
          line = regexprep(line,'%.*','');
          isif = regexp(line,'\<if\>', 'once');
          isend = regexp(line,'\<end\>(\w)*;?(\w)*$', 'once');
          issw = regexp(line,'\<switch\>','once');
          istry = regexp(line,'\<try\>','once');
          islp = regexp(line,'(\<for\>)|(\<while\>)', 'once');
          iscs = regexp(line,'\<case\>','once');
          isbr = regexp(line,'(\<otherwise\>)|(\<catch\>)|(\<elseif\>)|(\<else\>)','once');
          iscomp = regexp(line,'(\<otherwise\>)|(\<catch\>)|(\<elseif\>)|(\<if\>)|(\<while\>)|(\<for\>)|(\<case\>)|(\<continue\>)|(&&)|(||)','once');
          if ~isempty(iscomp{:})
            complexity = complexity + 1;
          end
          if setCondition && isempty(iscs{:})
            myBranch = fallback(end);
            branches{myBranch}(end+1) = i;
            setCondition = false;
          end
          if ~isempty(iscs{:}) || ~isempty(isbr{:})
            setCondition = true;
          end
          if ~isempty(isif{:}) || ~isempty(issw{:}) || ~isempty(istry{:})
            isBranch(i) = true;
            branches{i} = [];
            level = level + 1;
            fallback(end+1) = i;
            setCondition = true;
          elseif ~isempty(isend{:})
            fallback = fallback(1:end-1);
            level = level -1;
          elseif ~isempty(islp{:})
            fallback(end+1) = i;
            level = level + 1;
          end
        end
        mFiles(n).Methods(m).complexity = complexity;
      end
      mFiles(n).Methods(m).type = Methods(m).type;
      mFiles(n).Methods(m).name = Methods(m).name;
      mFiles(n).Methods(m).fullname = Methods(m).fullname;
      mFiles(n).Methods(m).firstline = Methods(m).firstline;
      mFiles(n).Methods(m).lastline = Methods(m).lastline;
      mFiles(n).Methods(m).linemask = Methods(m).linemask;
      mFiles(n).Methods(m).calls = Methods(m).calls;
      mFiles(n).Methods(m).calllines = Methods(m).calllines;
      mFiles(n).Methods(m).linerate = 0.0;
      mFiles(n).Methods(m).branchrate = 0.0;
    end
    mFiles(n).Source = struct('code',[],'scope',[],'branches',[],'isBranch',[],'hits',[],'condCovr',[],'time',[],'isMethod',[]);
    mFiles(n).Source.code = code;
    mFiles(n).Source.scope = scope;
    mFiles(n).Source.branches = branches;
    mFiles(n).Source.isBranch = isBranch;
    mFiles(n).Source.condCovr = condCovr;
    mFiles(n).Source.hits = hits;
    mFiles(n).Source.time = time;
    mFiles(n).Source.isMethod = isMethod;
    if length(mFiles(n).Methods) == 1,
      mFiles(n).complexity = sum([ mFiles(n).Methods.complexity] );
    else
      mFiles(n).complexity =  length(mFiles(n).Methods);
    end
  end
  D = dir(base_directory);
  SubDirs = D([D.isdir]);
  Ignore = strmatch('.',{SubDirs.name});
  Keep = true(size(SubDirs));
  Keep(Ignore) = false;
  Subbase_directorys = {SubDirs(Keep).name};
  for n = 1:length(Subbase_directorys)
    omitme = false;
    subDir = Subbase_directorys{n};
    for i = 1:length(omit_files)
      matchd = strmatch(omit_files{i},subDir);
      if ~isempty(matchd)
        omitme = true;
      end
    end
    if omitme,
      continue;
    end
    if strmatch('+',subDir) 
      if ~isempty(base_package),
        pkg = [base_package '.' subDir(2:end)];
      else
        pkg = subDir(2:end);
      end
    elseif strmatch('@',subDir),
      pkg = base_package;
    else
      pkg = subDir;
    end
    MM = mlcovr.getmfilelist([base_directory fs subDir],pkg,omit_files);
    if ~isempty(MM)
      mFiles = [mFiles MM];
    end
  end
end
