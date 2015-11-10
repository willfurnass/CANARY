classdef xml_test_result < mlunit.test_result
  %xml_test_result class.
  %  The constructor creates an object of the class xml_test_result. The
  %  output is written to the value of stream. The parameter verbosity
  %  defines, how much output is written. Possible values are 0, 1 and 2.
  %  The class xml_test_result is inherited from test_result and prints
  %  formatted test results to a stream.
  %
  %  Example:
  %    Output all results to the Matlab Command Window:
  %         result = xml_test_result(1, 0)
  %
  %  See also MLUNIT.TEST_RESULT.

  %  This Software and all associated files are released unter the
  %  GNU General Public License (GPL), see LICENSE for details.
  %
  %  §Author: Thomas Dohmke <thomas@dohmke.de> §
  %  $Id: xml_test_result.m 355 2008-04-06 10:16:12Z thomi $

  properties
    stream = 0;
    verbosity = 0;
    dots = 0;
    show_all = 0;
    suite = '';
  end

  methods
    function self = xml_test_result(stream, verbosity, suite)
      self.stream = stream;
      if (verbosity == 1)
        self.dots = 1;
        self.show_all = 0;
      elseif (verbosity > 1)
        self.dots = 0;
        self.show_all = 1;
      else
        self.dots = 0;
        self.show_all = 0;
      end;
      self.verbosity = verbosity;
      self.suite = suite;
    end

    function self = add_error(self, test, error)
      %xml_test_result.add_error calls the inherited method from
      %test_result and writes out an 'E' (verbosity == 1) or 'ERROR'
      %(verbosity == 2) to the stream.
      %
      %  Example:
      %    add_error is usually only called by the run method of
      %    test_case, see test_case.run:
      %         result = add_error(result, self, stacktrace);
      %
      %  See also MLUNIT.TEST_RESULT.ADD_ERROR, MLUNIT.TEST_CASE.RUN.

      self = add_error@mlunit.test_result(self, test, error);
      if (self.dots)
        fprintf(self.stream, 'E');
      elseif (self.show_all)
        fprintf(self.stream, 'ERROR');
      end;
    end

    function self = add_failure(self, test, failure)
      %xml_test_result.add_failure calls the inherited method from
      %test_result and writes out an 'F' (verbosity == 1) or
      %'FAILURE' (verbosity == 2) to the stream.
      %
      %  Example:
      %    add_failure is usually only called by the run method of
      %    test_case, see test_case.run:
      %         result = add_failure(result, self, errmsg);
      %
      %  See also MLUNIT.TEST_RESULT.ADD_FAILURE,
      %           MLUNIT.TEST_CASE.RUN.

      self = add_failure@mlunit.test_result(self, test, failure);
      if (self.dots)
        fprintf(self.stream, 'F');
      elseif (self.show_all)
        fprintf(self.stream, 'FAIL');
      end;
    end

    function self = add_success(self, test)
      %xml_test_result.add_success calls the inherited method from
      %test_result and writes out an '.' (verbosity == 1) or 'OK'
      %(verbosity == 2) to the stream.
      %
      %  Example:
      %    add_success is usually only called by the run method
      %    of test_case, see test_case.run:
      %         result = add_success(result, self);
      %
      %  See also MLUNIT.TEST_RESULT.ADD_SUCCESS,
      %           MLUNIT.TEST_CASE.RUN.

      self = add_success@mlunit.test_result(self, test);
      if (self.dots)
        fprintf(self.stream, '.');
      elseif (self.show_all)
        fprintf(self.stream, 'OK');
      end;
    end

    function description = get_description(self, test) %#ok
      %xml_test_result.get_description returns the name of the test.
      %
      %  Example:
      %    get_description is called by print_error_list to get the
      %    name of the test, in which an error or failure occured.
      %    See xml_test_result.print_error_list:
      %         get_description(self, errors{i, 1})
      %
      %  See also MLUNIT.TEXT_TEST_RESULT.PRINT_ERROR_LIST.

      description = str(test);
    end

    function print_test_list(self, type , tests)
      for i = 1:size(tests,1)
        fprintf(self.stream,'<testcase classname="%s" name="%s" time="%.3f" >\n',...
          class(tests{i,1}), tests{i,1}.name, tests{i,3});
        switch type
          case {'fail'}
            MEx = tests{i,2};
            fprintf(self.stream,'<failure type="%s" message="%s">\n',MEx.identifier,MEx.cause{1}.message);
            fprintf(self.stream,'<![CDATA[');
            fprintf(self.stream,'FAILURE: %s\n', MEx.message);
            stacktrace = 'Traceback (most recent call first): ';
            stack = MEx.stack;
            for j= 2:size(stack, 1)
              stacktrace = sprintf('%s\n  In %s at line %d', ...
                stacktrace, ...
                stack(j).file, stack(j).line);
            end;
            stacktrace = sprintf('%s\n', stacktrace);
            fprintf(self.stream,'%s',stacktrace);
            fprintf(self.stream,']]>\n');
            fprintf(self.stream,'</failure>\n');
          case {'error'}
            MEx = tests{i,2};
            fprintf(self.stream,'<error type="%s" message="%s">\n',MEx.identifier,MEx.message);
            fprintf(self.stream,'<![CDATA[');
            fprintf(self.stream,'ERROR: %s\n', MEx.message);
            stacktrace = 'Traceback (most recent call first): ';
            stack = MEx.stack;
            for j= 1:size(stack, 1)
              stacktrace = sprintf('%s\n  In %s at line %d', ...
                stacktrace, ...
                stack(j).file, stack(j).line);
            end;
            stacktrace = sprintf('%s\n', stacktrace);
            fprintf(self.stream,'%s',stacktrace);
            fprintf(self.stream,']]>\n');
            fprintf(self.stream,'</error>\n');
          otherwise
            % There is nothing else that needs reporting!
        end
        fprintf(self.stream,'</testcase>\n');
      end
    end

    
    function successes = get_success_list(self)
      successes = self.successes;
    end
    
    function successes = get_successes(self)
      successes = size(self.successes, 1);
    end

    function print_xUnit_result(self,time)
      %xml_test_result.print_xUnit_result write an xUnit formatted XML chunk to
      %the stream
      %

      fprintf(self.stream,'<testsuite name="%s" tests="%d" errors="%d" failures="%d" time="%.3f">\n',...
        self.suite, get_tests_run(self), get_errors(self), get_failures(self), time);
      print_test_list(self, 'okay', get_success_list(self));
      print_test_list(self, 'fail', get_failure_list(self));
      print_test_list(self, 'error', get_error_list(self));
      fprintf(self.stream,'<system-out><![CDATA[  ]]></system-out>\n');
      fprintf(self.stream,'<system-err><![CDATA[  ]]></system-err>\n');
      fprintf(self.stream,'</testsuite>\n');
    end

    function self = start_test(self, test)
      %xml_test_result.start_test calls the inherited method from
      %test_result and writes out the name of the test (both only at
      %verbosity == 2) to the stream.
      %
      %  Example:
      %    start_test is usually called by test_case.run to signal
      %    the start of the test execution to the test result:
      %         result = start_test(result, self);
      %
      %  See also MLUNIT.TEST_RESULT.START_TEST,
      %           MLUNIT.TEST_CASE.RUN.

      self = start_test@mlunit.test_result(self, test);
%       if (self.show_all)
%         fprintf(self.stream, get_description(self, test));
%         fprintf(self.stream, ' ... ');
%       end;
    end

    function self = stop_test(self, test)
      %xml_test_result.stop_test calls the inherited method from
      %test_result and writes out the time taken to run (only at
      %verbosity == 2) to the stream.
      %
      %  Example:
      %    stop_test is usually called by test_case.run to signal
      %    the end of the test execution to the test result:
      %         result = stop_test(result, self);
      %
      %  See also MLUNIT.TEST_RESULT.STOP_TEST,
      %           MLUNIT.TEST_CASE.RUN.

      self = stop_test@mlunit.test_result(self, test);
      if (self.show_all)
        fprintf(self.stream, '\n');
      end;
    end

  end

end
