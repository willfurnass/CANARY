classdef xml_test_runner < handle
    %text_test_runner class.
    %  The class text_test_runner runs a test_case or test_suite and 
    %  writes the results to a stream in textual form (using 
    %  text_test_result).
    %
    %  Example:
    %      runner = text_test_runner(1, 1);
    %      run(runner, mlunit_all_tests);
    %
    %  See also MLUNIT.TEXT_TEST_RESULT.

    %  This Software and all associated files are released unter the
    %  GNU General Public License (GPL), see LICENSE for details.
    %
    %  §Author: Thomas Dohmke <thomas@dohmke.de> §
    %  $Id: text_test_runner.m 353 2008-04-06 10:14:48Z thomi $

    properties
        stream
        verbosity
    end

    methods
        function self = xml_test_runner(stream )
            if (nargin == 0)
                stream = 1;
            end;
            if ischar(stream),
              try
                s = fopen(stream,'w');
              catch e
                warning(e.identifier,'%s: reverting to STDOUT',e.message);
                s = 1;
              end
              stream = s;
            end
            self.stream = stream;
            self.verbosity = 0;
            fprintf(self.stream,'<?xml version="1.0" encoding="utf-8"?>\n<testsuites>\n');
        end
        
        function delete( self )
          fprintf(self.stream,'</testsuites>\n');
          try
            fclose(self.stream);
          catch
          end
        end

        function result = run(self, test)
            %text_test_runner.run execute the test and writes the results 
            %to a stream in textual form (using TextTestResult).
            %
            %  Example:
            %      runner = text_test_runner(1, 1);
            %      run(runner, mlunit_all_tests);
            %
            %  See also MLUNIT.TEXT_TEST_RUNNER, MLUNIT.TEXT_TEST_RESULT.

            import mlunit.*;

            test_name = test;

            if (ischar(test))
                test = load_tests_from_test_case(test_loader, test);
            end;

            if (strcmp(class(test), 'double') && (isempty(test)))
                fprintf(self.stream, 'Test %s not found.\n', test_name);
                return;
            end;
            result = xml_test_result(self.stream, self.verbosity, test_name);
            t = clock;
            [test, result] = run(test, result); %#ok
            time = etime(clock, t);
            print_xUnit_result(result,time);
%             fprintf(self.stream, '----------------------------------------------------------------------\n');
%           tests_run = get_tests_run(result);
%           if (tests_run > 1)
%               fprintf(self.stream, 'Ran %d tests in %.3fs\n', ...
%                   tests_run, time);
%           else
%               fprintf(self.stream, 'Ran %d test in %.3fs\n', ...
%                   tests_run, time);
%           end;
%           fprintf(self.stream, '\n');
%           if (was_successful(result))
%               fprintf(self.stream, 'OK\n');
%           else
%               fprintf(self.stream, 'FAILED (errors=%d, failures=%d)\n', ...
%                   get_errors(result), get_failures(result));
%           end;
        end
    end
end
