%COVERAGERPTXML  Scan directories for coverage information.
%   COVERAGERPTXML checks which lines of which files have been executed
%   by the last generated profile, and outputs that information in the
%   Cobertura XML coverage format:
%                 (http://cobertura.sourceforge.net/xml/coverage-03.dtd)
%
%   COVERAGERPTXML(DIRNAME) scans the specified directory and
%   subdirectories and writes the output to stdout.
%
%   COVERAGERPTXML(DIRNAME,XMLFILE) writes the coverage report to the
%   specified file, XMLFILE.
%
%   XMLOUT = COVERAGERPTXML(...) return the generated XML text as a cell
%   array.
%
%   See also MAKECOVERAGE, GETMFILELIST, COVERAGERPT, PROFILE
%
% The MLCOVR package is part of FAST
% FAST: A Framework for Agile Software Development
% Copyright (c) 2008-2009 Sandia Corporation.	
% This software is distributed under the BSD License.	
% Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,	
% the U.S. Government retains certain rights in this software.	

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
function xmlOut = coveragerptxml(dirname,xmlFile,omitFiles,profileData)
  packages = [];
  profileBin = '';
  if nargin >= 4,
    if ischar(profileData)
      profileBin = profileData;
    elseif isstruct(profileData)
      packages = profileData;
    end
  end
  
  if nargin < 3,
    omitFiles = {matlabroot};
  elseif ischar(omitFiles)
    omitFiles = {omitFiles,matlabroot};
  end
  
  if nargin < 2,
    xmlFile = '';
  end
  
  if nargout == 0 && isempty(xmlFile)
    fprintf(2,'Generating XML coverage report and printing to console\n');
  end
  
  if nargin < 1;
    dirname = cd;
  end

  if isempty(packages)
  mFiles = mlcovr.getmfilelist(dirname,'',omitFiles);
  if isempty(profileBin)
    packages = mlcovr.makecoverage(dirname,mFiles);
  else
    packages = mlcovr.makecoverage(dirname,mFiles,profileBin);
  end
  end
  
  s = {};
  s{1} = '<?xml version="1.0" ?>';
  s{end+1} = '<!DOCTYPE coverage SYSTEM ''http://cobertura.sourceforge.net/xml/coverage-03.dtd''>';
  s{end+1} = '<coverage>';
  s{end+1} = sprintf(' <sources>');
  s{end+1} = sprintf('  <source>');
  s{end+1} = sprintf('   %s',dirname);
  s{end+1} = sprintf('  </source>');
  s{end+1} = sprintf(' </sources>');
  s{end+1} = sprintf(' <packages>');
  for p = 1:length(packages)
    myPackage = packages(p);
    s{end+1} = sprintf('  <package branch-rate="%.4f" complexity="%.4f" line-rate="%.4f" name="%s">',...
      myPackage.branchrate,myPackage.complexity,myPackage.linerate,myPackage.name);
    s{end+1} = sprintf('   <classes>');
    for c = 1:length(myPackage.Classes)
      myClass = myPackage.Classes(c);
      s{end+1} = sprintf('    <class branch-rate="%.4f" complexity="%.4f" filename="%s" line-rate="%.4f" name="%s">',...
        myClass.branchrate , myClass.complexity , myClass.filename, myClass.linerate , myClass.name );
      if myClass.isClassDef,
        s{end+1} = sprintf('     <methods>');
        for m = 1:length(myClass.Methods)
          s{end+1} = sprintf('      <method name="%s" signature="%s" line-rate="%.4f" branch-rate="%.4f">',...
            myClass.Methods(m).name , myClass.Methods(m).type , myClass.Methods(m).linerate , myClass.Methods(m).branchrate );
          s{end+1} = sprintf('       <lines>');
          for L = myClass.Methods(m).firstline:myClass.Methods(m).lastline
            if myClass.runnable(L),
              if myClass.Source.isBranch(L)
                s{end+1} = sprintf('        <line branch="true" condition-coverage="%s" hits="%d" number="%d"/>',...
                  myClass.Source.condCovr{L} , myClass.Source.hits(L) , L);
              else
                s{end+1} = sprintf('        <line branch="false" hits="%d" number="%d"/>',...
                  myClass.Source.hits(L) , L);
              end
            end
          end
          s{end+1} = sprintf('       </lines>');
          s{end+1} = sprintf('      </method>');
        end
        s{end+1} = sprintf('     </methods>');
      end
      s{end+1} = sprintf('     <lines>');
      for L = 1:length(myClass.runnable);
        if myClass.runnable(L),
          if myClass.Source.isBranch(L)
            s{end+1} = sprintf('      <line branch="true" condition-coverage="%s" hits="%d" number="%d"/>',...
              myClass.Source.condCovr{L} , myClass.Source.hits(L) , L);
          else
            s{end+1} = sprintf('      <line branch="false" hits="%d" number="%d"/>',...
              myClass.Source.hits(L) , L);
          end
        end
      end
      s{end+1} = sprintf('     </lines>');
      s{end+1} = sprintf('    </class>');
    end
    s{end+1} = sprintf('   </classes>');
    s{end+1} = sprintf('  </package>');
  end
  
  s{end+1} = sprintf(' </packages>');
  s{end+1} = sprintf('</coverage>');
  xmlOut = {s};
  
  if nargout == 0 && isempty(xmlFile)
    fid = 1;
  elseif isempty(xmlFile)
    return;
  else
    fid = fopen(xmlFile,'w');
    if fid < 1,
      error('MLCOVR:writexml',...
        'Error opening file for output %s',xmlFile);
    end
  end
  for i = 1:length(s)
    fprintf(fid,'%s\n',s{i});
  end
  if fid > 1,
    fclose(fid);
  end
end


