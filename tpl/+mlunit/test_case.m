classdef test_case
    %test_case class.
    %  The class test_case is the base class for all tests. It defines a
    %  fixture to run multiple tests. The constructor is called as follows:
    %         Example: test = test_case('test_foo', 'my_test');
    %  test_foo is the name of the test method, my_test is the name of a
    %  subclass of test_case. Such a class is created as follows:
    %
    %  1) Implement a subclass of test_class with a constructor looking
    %     like this:
    %         function self = my_test(name)
    %
    %         test = test_case(name, 'my_test');
    %         self.dummy = 0;
    %         self = class(self, 'my_test', test);
    %
    %  2) Define instance variables like self.dummy.
    %
    %  3) Override set_up to initialize the fixture.
    %
    %  4) Override tear_down to clean-up after a test.
    %
    %  5) Implement a method for each test looking like:
    %         function self = test_foo(self)
    %
    %         assert_equals(1, mod(4 * 4, 3));
    %
    %  6) Run the test:
    %         test = my_test('test_foo');
    %         [test, result] = run(test);
    %         summary(result)
    %
    %  See also MLUNIT.TEST_RESULT, MLUNIT.TEST_SUITE.

    %  This Software and all associated files are released unter the
    %  GNU General Public License (GPL), see LICENSE for details.
    %
    %  §Author: Thomas Dohmke <thomas@dohmke.de> §
    %  $Id: test_case.m 350 2008-04-05 13:56:38Z thomi $

    properties
        name
    end

    methods
        function self = test_case(name, subclass)

            if (nargin == 0)
                self.name = '';
            else
                self.name = name;

                if (nargin == 1)
                    if (isempty(self.name))
                        self.name = 'run_test';
                    end;
                else
                    if (isempty(self.name))
                        self.name = 'run_test';
                    else
                        r = reflect(subclass);
                        if (~method_exists(r, name))
                            error(['Method ', name ' does not exists.']);
                        end;
                    end;
                end;
            end;
        end

        function count = count_test_cases(self) %#ok
            %test_case.count_test_cases returns the number of test cases
            %executed by run.
            %  The default implementation of test_case returns always 1,
            %  because the test_case object consists only of one test
            %  method (whereas it is possible to define more than one test
            %  method within the test_case class).
            %
            %  Example:
            %         test = my_test('test_foo');
            %         count_test_cases(test);     % Returns 1

            count = 1;
        end

        function result = default_test_result(self) %#ok
            %test_case.default_test_result returns s default test_result
            %object.
            %  Usually default_test_result is used by the method
            %  test_case.run to obtain a default test result. If the
            %  results of more than tests should be collected within the
            %  same test result, default_test_result could be called before
            %  the execution of the tests.
            %
            %  Example:
            %         test1 = my_test('test_foo1');
            %         test2 = my_test('test_foo2');
            %         result = default_test_result(test1);
            %         [test1, result] = run(test1, result)
            %         [test2, result] = run(test2, result)
            %         summary(result)

            result = mlunit.test_result;
        end

        function [self, result] = run(self, result)
            %test_case.run executes the test case and saves the results in
            %result.
            %
            %  Example:
            %  There are two ways of calling run:
            %
            %  1) [test, result] = run(test) uses the default test result.
            %
            %  2) [test, result] = run(test, result) uses the result given
            %     as paramater, which allows to collect the result of a
            %     number of tests within one test result.

            if (nargin == 1)
                result = default_test_result(self);
            end;

            result = start_test(result, self);
            try
                try
                    self = set_up(self);
                catch err
                    result = add_error_with_stack(result, self, err);
                    return;
                end;

                ok = 0;
                try
                    method = self.name;
                    self = eval([method, '(self)']);
                    ok = 1;
                catch err
                    errmsg = err.identifier;
                    failure = strfind(errmsg, 'MLUNIT');
                    if (size(failure) > 0)
                        result = add_failure(result, self, err);
                    else
                        if (~isa(err, 'MException'))
                            err.stack(1).file = char(which(self.name));
                            err.stack(1).line = '1';
                            err.stack = vertcat(err.stack, ...
                                dbstack('-completenames'));
                        end;

                        result = add_error_with_stack(result, self, err);
                    end;
                end;

                try
                    self = tear_down(self);
                catch err
                    result = add_error_with_stack(result, self, err);
                    ok = 0;
                end;

                if (ok)
                    result = add_success(result, self);
                end;
            catch
              
            end;
            result = stop_test(result, self);

        end

        function self = run_test(self)
            %test_case.run_test is the default test method of test_case.
            %
            %  Example:
            %  Usually run_test (as every test method) is not called
            %  directly, but through the method run.
            %         test = function_test_case(@() assert(0 == sin(0)));
            %         [test, result] = run(test);
            %         summary(result)

        end

        function self = set_up(self)
            %test_case.set_up sets up the fixture and is called everytime
            %before a test is executed.
            %
            %  Example:
            %  set_up is not called directly, but through the method run.
            %         test = ... % e.g. created through my_test('test_foo')
            %         [test, result] = run(test);
            %         summary(result)

        end

        function s = str(self)
            %test_case.str returns a string with the method and class name
            %of the test.
            %
            %  Example:
            %  If a test method is defined as follows
            %           function test_method
            %               assert(0 == sin(0));
            %           end
            %  belonging to a class my_test, which is instantiated as
            %  follows
            %           test = my_test('test_method');
            %  then str will return:
            %           my_test('test_method')

            s = [class(self), '(''', self.name, ''')'];

        end

        function self = tear_down(self)
            %test_case.tear_down called everytime after a test is executed
            %for cleaning up the fixture.
            %
            %  Example:
            %  tear_down is not called directly, but through the method
            %  run. 
            %         test = ... % e.g. created through my_test('test_foo')
            %         [test, result] = run(test);
            %         summary(result)
        end

    end
end
