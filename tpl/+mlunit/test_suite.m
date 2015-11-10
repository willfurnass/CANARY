classdef test_suite
    %The class test_suite is a composite class to run multiple tests. A
    %test suite is created as follows:
    %
    %  Example:
    %         suite = test_suite;
    %         suite = add_test(suite, my_test('test_foo'));
    %         suite = add_test(suite, my_test('test_bar'));
    %  or
    %         loader = test_loader;
    %         suite = test_suite(load_tests_from_test_case(loader, 'my_test'));
    %
    %  Running a test suite is done the same way as a single test. Example:
    %         result = test_result;
    %         [suite, result] = run(suite, result);
    %         summary(result)
    %
    %  See also MLUNIT.TEST_CASE, MLUNIT.TEST_LOADER, MLUNIT.TEST_RESULT.

    %  This Software and all associated files are released unter the 
    %  GNU General Public License (GPL), see LICENSE for details.
    %  
    %  §Author: Thomas Dohmke <thomas@dohmke.de> §
    %  $Id: test_suite.m 353 2008-04-06 10:14:48Z thomi $

    properties
        tests = {};
        name = '';
    end
    
    methods
        function self = test_suite(tests)
            if (nargin == 0)
                tests = [];
            end;
            
            if (iscell(tests))
                self.tests = {};
                for i = 1:length(tests)
                    self.tests{i} = tests{i};
                end;
            else
                self.tests = {};
            end;
        end
        
        function self = add_test(self, test)
            %test_suite.add_test adds a test to the test suite.
            %  If test is empty, nothing is done.
            %
            %  Example:
            %         suite = test_suite;
            %         suite = add_test(suite, my_test('test_foo'));
            %         suite = add_test(suite, my_test('test_bar'));
            %         count_test_cases(suite); % Should return 2.
            %
            %  See also MLUNIT.TEST_SUITE.

            if (~isempty(test))
                self.tests{length(self.tests) + 1} = test;
            end;
        end

        function self = add_tests(self, tests)
            %test_suite.add_test adds a cell array of tests to the test 
            %suite.
            %
            %  Example:
            %         suite = test_suite;
            %         suite = add_tests(suite, {my_test('test_foo') ...
            %             my_test('test_bar')});
            %         count_test_cases(suite); % Should return 2.
            %
            %  See also MLUNIT.TEST_SUITE.

            if (iscell(tests))
                last = length(self.tests);
                for i = 1:length(tests)
                    self.tests{last + i} = tests{i};
                end;
            end;
        end
        
        function count = count_test_cases(self)
            %test_suite.count_test_cases returns the number of test cases 
            %executed by run.
            %
            %  Example:
            %         suite = mlunit_all_tests;
            %         count_test_cases(test);     
            %
            %  See also MLUNIT.TEST_SUITE, MLUNIT.TEST_CASE.

            tests = length(self.tests);
            count = 0;
            for i = 1:tests
                count = count + count_test_cases(self.tests{i});
            end;
        end
        
        function [self, result] = run(self, result)
            %test_suite.run executes the test suite and saves the results 
            %in result.
            %
            %  Example:
            %    Running a test suite is done the same way as a single 
            %    test. 
            %         suite = ...; % Create test suite, e.g. with test_loader.
            %         result = test_result;
            %         [suite, result] = run(suite, result);
            %         summary(result)
            %
            %  See also MLUNIT.TEST_SUITE.

            for i = 1:length(self.tests)
                if (get_should_stop(result))
                    break;
                end;

                [self.tests{i}, result] = run(self.tests{i}, result);
            end;
        end
        
        function self = set_name(self, name)
            %test_suite.set_name sets an optional name for the test suite.
            %  The name is used by gui_test_runner to re-run a test_suite, 
            %  which is created by an .m-file.
            %
            %  Example:
            %         function suite = all_tests
            %
            %         suite = test_suite;
            %         suite = set_name(suite, 'all_tests');
            %         suite = add_test(suite, my_test('test_foo'));
            %         suite = add_test(suite, my_test('test_bar'));

            self.name = name;        
        end
        
        function s = str(self)
            %test_suite.str returns a string with the name of the test 
            %suite. The name has to be set with test_suite.set_name first.
            %
            %  Example: 
            %         str(mlunit_all_tests)

            s = self.name;
        end
    end
end