classdef test_result
    %test_result class.
    %  The class test_result collects test results of executed tests. As 
    %  in the other testing frameworks of the xUnit family the framework
    %  differs between failure and error. A failure is raised by an 
    %  assertion, that means by the method assert, while an error is 
    %  raised by the Matlab environment, for example through a syntax 
    %  error.
    %
    %  Example:
    %         result = test_result;
    %
    %  See also MLUNIT.ASSERT, 
    %           MLUNIT.ASSERT_EQUALS, 
    %           MLUNIT.ASSERT_NOT_EQUALS, 
    %           MLUNIT.TEXT_TEST_RESULT.

    %  This Software and all associated files are released unter the
    %  GNU General Public License (GPL), see LICENSE for details.
    %
    %  §Author: Thomas Dohmke <thomas@dohmke.de> §
    %  $Id: test_result.m 350 2008-04-05 13:56:38Z thomi $
    %
    %  Revision: David Hart <dbhart@users.sourceforge.net> 
    %   - Added timing function in start/stop to track runs

    properties
        tests_run = 0;
        successes = {};
        errors = {};
        failures = {};
        should_stop = 0;
        time = 0;
    end

    properties ( SetAccess = 'protected' , GetAccess = 'protected' )
      t
    end
    
    methods
        function self = add_error_with_stack(self, test, err)
            %test_result.add_error_with_stack adds an error for the test 
            %to the list of errors using the struct members of lasterror 
            %(file and stack) to generate a more detailed error report.
            %
            %  Example:
            %         result = add_error_with_stack(result, self, lasterror);
            %
            %  See also MLUNIT.TEST_RESULT.ADD_ERROR, MLUNIT.TEST_CASE.RUN.

%             stacktrace = '';
%             for i = 1:size(err.stack, 1)
%                 stacktrace = sprintf('%s\n  In %s at line %d', ...
%                     stacktrace, ...
%                     err.stack(i).file, err.stack(i).line);
%             end;
%             [message, stacktrace] = parse_error(self, err.message, stacktrace);
%             stacktrace = sprintf('%s\n', stacktrace);
            self = add_error(self, test, err );
%                 test, ...
%                 ['Traceback (most recent call first): ', ...
%                 stacktrace, ...,
%                 'Error: ', ...
%                 message]);
        end
        
        function self = add_error(self, test, error)
            %test_result.add_error adds an error for the test to the list 
            %of errors.
            %
            %  Example:
            %    add_error is usually only called by the run method of 
            %    test_case, see test_case.run:
            %         result = add_error(result, self, stacktrace);
            %
            %  See also MLUNIT.TEST_CASE.RUN.
            time = etime(clock, self.t);
%             newlines = sprintf('\n\n');
%             if (size(strfind(error, newlines)) == 0)
%                 error = sprintf('%s\n\n', error);
%             end;
            last = size(self.errors, 1);
            self.errors{last + 1, 1} = test;
            self.errors{last + 1, 2} = error;
            self.errors{last + 1, 3} = time;
        end

        function self = add_failure(self, test, failure)
            %test_result.add_failure adds a failure for the test to the 
            %list of failures.
            %
            %  Example:
            %  add_failure is usually only called by the run method of 
            %  test_case, see test_case/run:
            %         result = add_failure(result, self, errmsg);
            %
            %  See also TEST_CASE/RUN.
            time = etime(clock, self.t);
            last = size(self.failures, 1);
            self.failures{last + 1, 1} = test;
            self.failures{last + 1, 2} = failure;
            self.failures{last + 1, 3} = time;
        end

        function self = add_success(self, test) %#ok
            %test_result.add_success is an empty method for classes, which 
            %might do some action on a successful test.
            %
            %  Example:
            %    add_success is usually only called by the run method of 
            %    test_case, see test_case.run:
            %         result = add_success(result, self);
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.ADD_SUCCESS, 
            %           MLUNIT.TEST_CASE.RUN.
            time = etime(clock, self.t);
            last = size(self.successes, 1);
            self.successes{last + 1 , 1} = test;
            self.successes{last + 1 , 3} = time;
        end

        function errors = get_error_list(self)
            %test_result.get_error_list returns a cell array of tests and 
            %errors.
            %
            %  Example:
            %    get_error_list is called for example from 
            %    text_test_result.print_errors:
            %         get_error_list(self)
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.PRINT_ERRORS.

            errors = self.errors;
        end

        function errors = get_errors(self)
            %test_result.get_errors returns the number of errors.
            %
            %  Example:
            %    get_error_list is called for example from 
            %    text_test_result.run:
            %         get_errors(self)
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.RUN.

            errors = size(self.errors, 1);
        end

        function failures = get_failure_list(self)
            %test_result.get_failure_list returns a cell array of tests 
            %and failures.
            %
            %  Example:
            %    get_error_list is called for example from 
            %    text_test_result.print_errors:
            %         get_failure_list(self)
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.PRINT_ERRORS.

            failures = self.failures;
        end

        function failures = get_failures(self)
            %test_result.get_errors returns the number of failures.
            %
            %  Example:
            %    get_error_list is called for example from 
            %    text_test_result.run:
            %         get_errors(self)
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.RUN.

            failures = size(self.failures, 1);
        end

        function successes = get_success_list(self)
          successes = self.successes;
        end
        
        function successes = get_successes(self)
          successes = size(self.successes, 1);
        end
        
        function should_stop = get_should_stop(self)
            %test_result.get_should_stop returns whether the test should 
            %stop or not.
            %
            %  Example:
            %    get_should_stop is called for example from test_suite.run:
            %         get_should_stop(result)
            %
            %  See also MLUNIT.TEST_SUITE.RUN.

            should_stop = self.should_stop;
        end

        function tests_run = get_tests_run(self)
            %test_result.tests_run returns the number of tests executed.
            %
            %  Example:
            %    get_tests_run is called for example from 
            %    text_test_runner.run:
            %         tests_run = get_tests_run(result);
            %
            %  See also MLUNIT.TEXT_TEST_RUNNER.RUN.

            tests_run = self.tests_run;
        end

        function [error, stacktrace] = parse_error(self, error, stacktrace) %#ok<INUSL>
            %test_result.parse_error parses special errors to extract 
            %further information for the stacktrace.
            %
            %  Example: See test_result.add_error_with_stack.
            %
            %  See also MLUNIT.TEST_RESULT.ADD_ERROR_WITH_STACK.

            if (~isempty(strfind(error, 'Unbalanced or misused parentheses or brackets.')) || ...
                    ~isempty(strfind(error, 'Unbalanced or unexpected parenthesis or bracket.')))
                [tokens] = regexp(error, 'Error:.*File:\ ([\w\ \.,$&/\\:@]*.m)\ Line: (\w*)\ Column: (\w*).*', 'tokens', 'once');
                if (length(tokens) == 3)
                    fullname = which(char(tokens(1)));
                    if (~isempty(fullname))
                        stacktrace = sprintf('\n  In %s at line %s%s', ...
                            fullname, char(tokens(2)), ...
                            stacktrace);
                    else
                        stacktrace = sprintf('\n  In %s at line %s%s', ...
                            char(tokens(1)), char(tokens(2)), ...
                            stacktrace);
                    end;
                    error = 'Unbalanced or misused parentheses or brackets.';
                end;
            else
                [tokens] = regexp(error, 'Error using ==> <a href.*>(.*)</a>\n(.*)', 'tokens', 'once');
                if (length(tokens) == 2)
                    error = char(tokens(2));
                end;
            end;
        end

        function self = set_should_stop(self)
            %test_result.set_should_stop indicates that the execution of 
            %tests should stop.
            %
            %  Example:
            %         result = test_result;
            %         % Do something, e.g. iterate through a number of tests, ...
            %         result = set_should_stop(result);

            self.should_stop = 1;
        end

        function self = start_test(self, test) %#ok
            %test_result.start_test indicates that a test will be started.
            %
            %  Example:
            %    start_test is usually called by test_case.run to signal 
            %    the start of the test execution to the test result:
            %         result = start_test(result, self);
            %
            %  See also MLUNIT.TEST_CASE.RUN.
            self.t = clock;
            self.tests_run = self.tests_run + 1;
        end

        function self = stop_test(self, test) %#ok
            %test_result.stop_test indicates that a test has been finished.
            %
            %  Example:
            %    stop_test is usually called by test_case.run to signal 
            %    the end of the test execution to the test result:
            %         result = stop_test(result, self);
            %
            %  See also MLUNIT.TEST_CASE.RUN.
        end

        function s = summary(self)
            %test_result.summary returns a string with a summary of the 
            %test result.
            %
            %  Example:
            %         test = ... % e.g. created through my_test('test_foo')
            %         [test, result] = run(test);
            %         summary(result)

            s = sprintf('%s run=%d errors=%d failures=%d', ...
                class(self), self.tests_run, get_errors(self), ...
                get_failures(self));
        end

        function success = was_successful(self)
            %test_result.was_successful returns whether the test was 
            %successful or not.
            %
            %  Example:
            %    was_successful is called for example from 
            %    text_test_result.run:
            %         was_successful(result)
            %
            %  See also MLUNIT.TEXT_TEST_RESULT.RUN.

            if (size(self.errors, 1) + size(self.failures, 1) == 0)
                success = 1;
            else
                success = 0;
            end;
        end
    end
end
