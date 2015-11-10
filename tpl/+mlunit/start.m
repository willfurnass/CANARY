function varargout = start(dock)
%mlunit.start executes the the graphical user interface of mlUnit.
%
%  Example:
%         mlunit.start;    % Run in window mode
%         mlunit.start(1); % Run in docked mode
%
%  See also MLUNIT.GUI_TEST_RUNNER.RUN.

%  This Software and all associated files are released unter the 
%  GNU General Public License (GPL), see LICENSE for details.
%  
%  §Author: Thomas Dohmke <thomas@dohmke.de> §
%  $Id: mlunit.m 321 2008-03-29 13:26:46Z thomi $

switch (nargin)
    case 0
        run(mlunit.gui_test_runner, '', 0);
    case 1
        run(mlunit.gui_test_runner, '', dock);
    otherwise
        % Do nothing
end;
