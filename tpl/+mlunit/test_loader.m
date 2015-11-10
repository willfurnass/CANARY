classdef test_loader
    %test_loader class.
    %  The class test_loader is able to create a test_suite with all
    %  test* methods from a test_case.
    %
    %  Example:
    %         loader = test_loader;
    %         suite = test_suite(load_tests_from_test_case(loader, 'my_test'));

    %  This Software and all associated files are released unter the
    %  GNU General Public License (GPL), see LICENSE for details.
    %
    %  §Author: Thomas Dohmke <thomas@dohmke.de> §
    %  $Id: test_loader.m 350 2008-04-05 13:56:38Z thomi $

    properties
      name
    end

    methods
        function names = get_test_case_names(self, test_case_class) %#ok
            %test_loader.get_test_case_names returns a list of string 
            %with all test* methods from the test_case_class.
            %
            %  Example:
            %    get_test_case_names is for examplecalled from
            %    test_loader.load_tests_from_test_case:
            %         names = get_test_case_names(self, test_case_class);
            %
            %  See also MLUNIT.TEST_LOADER.LOAD_TESTS_FROM_MFILE.

            import mlunit.*;
            
            t = reflect(test_case_class);
            names = get_methods(t);
            for i = size(names, 1):-1:1
                if (~strncmp(names(i), 'test', 4))
                    names(i) = [];
                end;
            end;
            names = sortrows(names);
            if (~isempty(names))
                t = eval([test_case_class, '(''', char(names(1)), ''')']);
            end;

            if (~isa(t, 'test_case'))
                names = [];
            end;
        end

        function suite = load_tests_from_test_case(self, test_case_class)
            %test_loader.load_tests_from_test_case returns a test_suite 
            %with all test* methods from a test_case.
            %  It returns an empty matrix, if the test is not found.
            %
            %  Example:
            %         loader = test_loader;
            %         suite = test_suite(load_tests_from_test_case(loader, 'my_test'));

            import mlunit.*;

            suite = [];
            names = get_test_case_names(self, test_case_class);
            if (~isempty(names))
                suite = test_suite(map(self, ...
                    test_case_class, ...
                    names));
            end;
            self.name = test_case_class;
        end

        function tests = map(self, test_case_class, test_names) %#ok
            %test_loader.map returns a list of objects instantiated from 
            %the class test_case_class and the methods in test_names.
            %
            %  Example:
            %    If you have for example a test_case my_test with two 
            %    methods test_foo1 and test_foo2, then
            %         map(test_loader, 'my_test', {'test_foo1' 'test_foo2'})
            %    returns a list with two objects of my_tests, one 
            %    instantiated with test_foo1, the other with test_foo2.
            %
            %  See also MLUNIT.TEST_LOADER.LOAD_TESTS_FROM_MFILE.

            tests = {};
            for i = 1:length(test_names)
                test = eval([test_case_class, '(''', char(test_names(i)), ''')']);
                tests{i} = test; %#ok<AGROW>
            end;
        end
    end
end
