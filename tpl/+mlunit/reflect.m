classdef reflect
  %reflect class.
  %  The class reflect helps to find out which methods to a class belong.
  %  In fact it is simply a wrapper for the Matlab methods function,
  %  providing a method checking whether a method within a class exists
  %  or not, and a method returning all methods of a class as a cell
  %  array.
  %
  %  Example:
  %         r = reflect('test_case');
  %         method_exists(r, 'run');  % Return true
  %         method_exists(r, 'fail'); % Returns false
  %         get_methods(r);           % Returns a cell array with all
  %                                   % methods of the class test_case

  %  This Software and all associated files are released unter the
  %  GNU General Public License (GPL), see LICENSE for details.
  %
  %  §Author: Thomas Dohmke <thomas@dohmke.de> §
  %  $Id: reflect.m 345 2008-04-05 10:37:33Z thomi $

  properties
    class_name
    full_class_name
  end

  methods
    function self = reflect(class_name)
      split = regexp(class_name, '\.', 'split');
      self.full_class_name = class_name;
      self.class_name = split(end);
    end

    function methds = get_methods(self)
      %reflect.get_methods returns the list of methods of the
      %'reflected' class.
      %
      %  Example:
      %         r = reflect('test_case');
      %         get_methods(r);           % Returns a cell array
      %                                   % with all methods of the
      %                                   % class test_case
      %
      %  See also MLUNIT.REFLECT.

      methds = [];
      if (~isempty(self.full_class_name))
        try
          object = eval(sprintf('%s', self.full_class_name));
          d = methods(object); % FIXME , '-full');
        catch exception %#ok<NASGU>
          d = methods(self.full_class_name); % FIXME , '-full');
        end;

        for i = 1:size(d, 1)
          method = cellstr(d(i));
          if (~strcmp(self.class_name, method))
            methds = [methds; method]; %#ok<AGROW>
          end;
        end;
      end;
    end

    function exists = method_exists(self, method_name)
      %reflect.method_exists returns true, if a method with the name
      %method_name exists in the 'reflected' class.
      %
      %  Example:
      %         r = reflect('test_case');
      %         method_exists(r, 'run');  % Return true
      %         method_exists(r, 'fail'); % Returns false
      %
      %  See also MLUNIT.REFLECT.

      exists = ismember(method_name, get_methods(self));
    end
  end
end
