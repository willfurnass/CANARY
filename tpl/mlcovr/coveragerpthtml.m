%COVERAGERPTXML  Scan directories for coverage information.
%   COVERAGERPTXML checks which lines of which files have been executed
%   by the last generated profile, and outputs that information in the
%   Cobertura XML coverage format:
%                 (htdp://cobertura.sourceforge.net/xml/coverage-03.dtd)
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
%   modification, are permitded provided that the following conditions are
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
%     this software without specific prior writden permission.
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
function varargout = coveragerpthtml(varargin)
  packages = [];
  profileBin = '';
  omitFiles = {matlabroot};
  htmlDir = 'html';
  dirname = cd();
  
  if nargout > 0,
    varargout{1} = packages;
  end
  
  i = 1;
  while i <= nargin,
    val = varargin{i};
    switch (val)
      case {'BaseDir'}
        dirname = varargin{i+1};
        i = i + 2;
      case {'HtmlDir'}
        htmlDir = varargin{i+1};
        i = i + 2;
      case {'Packages'}
        if isstruct(varargin{i+1}),
          packages = varargin{i+1};
        else
          profileBin = varargin{i+1};
        end
        i = i + 2;
      case {'OmitList'}
        omit = varargin{i+1};
        if ischar(omit),
          omitFiles = {omit , matlabroot()};
        elseif iscell(omit)
          omitFiles = omit;
        else
        end
        i = i + 2;
      otherwise
        i = i + 1;
    end
  end
  
  if isempty(packages)
    mFiles = mlcovr.getmfilelist(dirname,'',omitFiles);
    if isempty(profileBin)
      packages = mlcovr.makecoverage(dirname,mFiles);
    else
      packages = mlcovr.makecoverage(dirname,mFiles,profileBin);
    end
  end
  
  indexFID = fopen(fullfile(htmlDir,'index.html'),'w');
  
  openhtml(indexFID,['Coverage report for ' dirname]);
  fs = filesep();
  
  fprintf(indexFID,'<h2>Packages and Directories</h2>');
  fprintf(indexFID,'<table cellspacing="0" class="body" cellpadding="4" border="2">\n');
  fprintf(indexFID,'<tr><th>Name</th><th>Directory</th><th>Branch Rate</th><th>Line Rate</th><th>Complexity</th></tr>\n');
  for p = 1:length(packages)
    % Print data for each package
    myPackage = packages(p);
    nClasses = length(myPackage.Classes);
    if strcmp(myPackage.name,'base'),
      pkgDir = dirname;
    else
      pkgDir = [dirname fs '+' strrep(myPackage.name,'.',[fs '+'])];
      pkgDir = strrep(pkgDir,[fs fs],fs);
    end
    fprintf(indexFID,'<tr><td>%s</td><td>%s</td><td>%.2f%%</td><td>%.2f%%</td><td>%d</td></tr>\n',myPackage.name,pkgDir,myPackage.branchrate*100,myPackage.linerate*100,nClasses);
  end
  fprintf(indexFID,'</table>\n');
  
  fprintf(indexFID,'<h2>Files</h2>');
  fprintf(indexFID,'<table cellspacing="0" class="body" cellpadding="4" border="2">\n');
  fprintf(indexFID,'<tr><th>Name</th><th>Type</th><th>Branch Rate</th><th>Line Rate</th><th>Complexity</th></tr>\n');
  for p = 1:length(packages)
    myPackage = packages(p);
    nClasses = length(myPackage.Classes);
    if strcmp(myPackage.name,'base'),
      pkg = '';
    else
      pkg = [myPackage.name '.'];
    end
    if nClasses > 0,
      for c = 1:length(myPackage.Classes)
        % Print data for each class
        myClass = myPackage.Classes(c);
        htmlClassFile = [ pkg myClass.name ];
        nMethods = length(myClass.Methods);
        if myClass.isClassDef,
          classType = 'Class';
          compl = nMethods;
          highlight = '';
        else
          classType = 'Function';
          compl = myClass.complexity;
          if compl > 15,
            highlight = ' style="background-color: #FFFF99" ';
          else
            highlight = '';
          end
          
        end
        fprintf(indexFID,'<tr><td>%s<a href="%s.html">%s</a></td><td>%s</td><td align="right" >%.2f%%</td><td align="right" >%.2f%%</td><td align="right" %s >%d</td></tr>\n', pkg, htmlClassFile, myClass.name, classType, myClass.branchrate*100, myClass.linerate*100, highlight, compl);
        
        % Print class file header
        classFID = fopen(fullfile(htmlDir,[htmlClassFile '.html']),'w');
        openhtml(classFID,['Coverage report for ' myClass.filename]);
        if nMethods > 0,
          fprintf(classFID,'<h2>Methods and Sub-functions</h2>');
          fprintf(classFID,'<a name="top"></a><table cellspacing="0" class="body" cellpadding="4" border="2">\n');
          fprintf(classFID,'<tr><th>Name</th><th>Signature</th><th>Branch Rate</th><th>Line Rate</th><th>Complexity</th></tr>\n');
          
          for m = 1:nMethods
            % Print data for each class method
            methMask = myClass.Methods(m).firstline:myClass.Methods(m).lastline;
            methTime = nansum(myClass.Source.time(methMask));
            myClass.Source.time(methMask) = myClass.Source.time(methMask) ./ methTime;
            myClass.Source.time(~myClass.runnable) = 0;
            branchable = sum(myClass.Source.isBranch & myClass.Methods(m).linemask > 0);
            compl = myClass.Methods(m).complexity;
            if compl > 15,
              highlight = ' style="background-color: #FFFF99" ';
            else
              highlight = '';
            end
            if branchable == 0,
              fprintf(classFID,'<tr><td><a href="#line%d">%s</a></td><td>%s</td><td align="right" > --- </td><td align="right" >%.1f%%</td><td align="right" %s >%d</td></tr>\n',myClass.Methods(m).firstline,myClass.Methods(m).name , myClass.Methods(m).type , myClass.Methods(m).linerate*100 , highlight, myClass.Methods(m).complexity);
            else
              fprintf(classFID,'<tr><td><a href="#line%d">%s</a></td><td>%s</td><td align="right" >%.1f%%</td><td align="right" >%.1f%%</td><td align="right" %s >%d</td></tr>\n',myClass.Methods(m).firstline,myClass.Methods(m).name , myClass.Methods(m).type , myClass.Methods(m).branchrate*100 , myClass.Methods(m).linerate*100 , highlight, myClass.Methods(m).complexity);
            end
          end
          fprintf(classFID,'</table>');
        end
        
        fprintf(classFID,'<h2>Source Code</h2>');
        fprintf(classFID,'<table cellspacing="0" class="body" cellpadding="0" align="left" border="0">\n');
        fprintf(classFID,'<colgroup><col style="font-family: monospace" align="right" width="50"><col style="font-family: monospace" align="right" width="100"><col style="font-family: monospace" align="left"\n');
        % Print class code line details
        classScope = 0;
        contScope = 0;
        classTime = sum(myClass.Source.time);
        nLines = length(myClass.Source.code);
        fprintf(classFID,'<tr><th >Line</th><th>Coverage</th><th>Source</th></tr>\n');
        
        for L = 1:nLines;
          if strncmp(myClass.Source.code{L},'%',1),
            isComment = true;
          else
            isComment = false;
          end
          
          scIndent = repmat('&nbsp;&nbsp;',[1 classScope+contScope]);
          line = myClass.Source.code{L};
          hasString = regexp(line,'(\(.*\))|(\{.*\})|(\[.*\])','once');
          while ~isempty(hasString)
            line = regexprep(line,'(\(.*\))|(\{.*\})|(\[.*\])','');
            hasString = regexp(line,'(\(.*\))|(\{.*\})|(\[.*\])','once');
          end
          line = regexprep(line,'(%.*)|(\(.*)|(.*\))','');
          
          isDefin = ~isempty(regexp(line,'(\<classdef\>)|(\<methods\>)|(\<properties\>)', 'once'));
          isfnc = ~isempty(regexp(line,'^function\>','once'));
          isif = ~isempty(regexp(line,'\<if\>', 'once'));
          isend = ~isempty(regexp(line,'(\<end\>(\w)*;?(\s)*$)|(^end\W*)$)', 'once'));
          issw = ~isempty(regexp(line,'\<switch\>','once'));
          istry = ~isempty(regexp(line,'\<try\>','once'));
          islp = ~isempty(regexp(line,'(\<for\>)|(\<while\>)', 'once'));
          iscs = ~isempty(regexp(line,'\<case\>','once'));
          isbr = ~isempty(regexp(line,'(\<otherwise\>)|(\<catch\>)|(\<elseif\>)|(\<else\>)','once'));
          
          if isDefin || isfnc || isif || issw || istry || islp
            if ~isComment
              classScope = classScope + 1;
            end
          elseif iscs || isbr
            scIndent = repmat('&nbsp;&nbsp;',[1 classScope-1]);
          end
          if isend
            if ~isComment
              classScope = classScope - 1;
              scIndent = repmat('&nbsp;&nbsp;',[1 classScope]);
            end
          end
          
          
          if myClass.Source.hits(L) > 0,
            lineRan = true;
          elseif ~myClass.runnable(L)
            lineRan = true;
          else
            lineRan = false;
          end
          
          if myClass.Source.time(L) > .1 && myClass.Source.time(L) > 2/nLines,
            time = sprintf('; background-color: #FF%X%X',floor((1-myClass.Source.time(L))*255),floor((1-myClass.Source.time(L))*255));
          else
            time = '';
          end
          
          if isfnc,
            lineNum = sprintf('<a name="line%d" >%d</a>',L,L);
          else
            lineNum = sprintf('%d',L);
          end
          %hits = num2str(myClass.Source.hits(L),'%d');
          hits = '';
          if isComment
            colorSt = '#005500';
            styleSt = 'italic';
            time = '';
            hits = '';
          elseif isfnc
            colorSt = '#000088';
            styleSt = 'serif';
            time = '';
            hits = '<a href="#top">^ Top ^</a>';
          elseif isDefin || iscs || isbr
            colorSt = '#000088';
            styleSt = 'serif';
            time = '';
            hits = '';
          elseif myClass.Source.isBranch(L)
            colorSt = '#000088';
            styleSt = 'bold';
            time = '';
            hits = myClass.Source.condCovr{L};
          elseif lineRan
            colorSt = '#000000';
            styleSt = 'serif';
          else
            colorSt = '#888888';
            styleSt = 'serif';
            time = '';
            hits = '';
          end
          if contScope == 1,
            colorSt = lastColor;
            styleSt = lastStyle;
          end
          if length(myClass.Source.code{L}) > 2 && strcmp(myClass.Source.code{L}(end-2:end),'...'),
            contScope = 1;
          else
            contScope = 0;
          end
          lastColor = colorSt;
          lastStyle = styleSt;
          fprintf(classFID,'<tr align="left"  style="font-family: monospace" ><td align="left" style="font-family: monospace %s" >%s&nbsp;</td><td>%s&nbsp;&nbsp;</td><td align="left" style="color: %s; font-style: %s; font-family: monospace" >%s%s</td></tr>\n',time,lineNum,hits,colorSt,styleSt,scIndent,myClass.Source.code{L});
        end
        fprintf(classFID,'</table><br>');
        closehtml(classFID);
        fclose(classFID);
      end
    end
  end
  fprintf(indexFID,'</table>');
  
  
  closehtml(indexFID);
  fclose(indexFID);
  
  if nargout > 0,
    varargout{1} = packages;
  end
  
end

function openhtml(FID,title)
  fprintf(FID,'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "htdp://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n');
  fprintf(FID,'<html xmlns="htdp://www.w3.org/1999/xhtml" lang="en" xml:lang="en">');
  fprintf(FID,'<head><title>%s</title></head>\n',title);
  fprintf(FID,'<body><h2>%s</h2>\n',title);
end

function closehtml(FID)
  fprintf(FID,'<br><i>Last modified: %s</i></body></html>',datestr(now(),31));
end
