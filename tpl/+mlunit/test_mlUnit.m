classdef test_mlUnit < mlunit.test_case

  properties
    a = 1;
    b = 2;
    S = 'string';
    R = 'really long string';
  end
  
  methods
    function self = test_mlUnit(varargin)
      self = self@mlunit.test_case(varargin{:});
    end
    
    function self = test_assert_fails( self )
      mlunit.assert(self.a == self.b);
    end
    
    function self = test_assert_passes( self )
      mlunit.assert(self.a == self.a);
    end
    
    function self = test_assert_equals_passes( self )
      mlunit.assert_equals(self.a,self.a);
      mlunit.assert_equals(self.R,self.R);
    end
    
    function self = test_assert_equals_fails( self )
      mlunit.assert_equals(self.a,self.R);
    end
    
    function self = test_assert_not_equals_passes( self )
      mlunit.assert_not_equals(self.a,self.b);
      mlunit.assert_not_equals(self.S,self.R);
      mlunit.assert_not_equals(self.a,self.R);
    end
    
    function self = test_assert_not_equals_fails( self )
      mlunit.assert_not_equals(self.a,self.a);
    end
    
    function self = test_error_occurs( self )
      cat blah;
    end
    
  end
  
end
