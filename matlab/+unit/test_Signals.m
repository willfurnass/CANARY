classdef test_Signals < mlunit.test_case

  properties 
    testObj = [];
    baseObj = [];
  end
  
  methods

    function test_obj = test_Signals(varargin)
      test_obj = test_obj@mlunit.test_case(varargin{:});
      test_obj.testObj = cws.Signals();
    end
    
    % Public Unit Tests
    function self = test_01_constructor( self )
      testObj = self.testObj;
      mlunit.assert(isa(testObj,'cws.Signals'));
      mlunit.assert_equals(1,testObj.nsigs);
      mlunit.assert_equals(0,testObj.nlocs);
      mlunit.assert_equals('zeros',testObj.names{1});
      mlunit.assert_equals(1,length(testObj.scadatags));
      mlunit.assert(isempty(testObj.timesteps));
    end
    
%     function self = test_eddies_02_connect( self )
%       mlunit.assert_equals(0,self.eddiesObj.Isconnected);
%       mlunit.assert_equals(1,self.eddiesObj.Isconnected);
%     end
%     
%     function self = test_eddies_03_initialize( self )
%       mlunit.assert_equals(0,self.eddiesObj.Isinitialized);
%       mlunit.assert_equals(0,self.eddiesObj.Isinitialized);
%       mlunit.assert_equals(1,self.eddiesObj.Isinitialized);
%     end      
%     
%     function self = test_eddies_04_read_data( self )
%       mlunit.assert(nansum(nansum(self.eddiesObj.data.values(:,:)))~=0);
%     end
% 
%     function self = test_eddies_05_disconnect( self )
%       mlunit.assert_equals(1,self.eddiesObj.Isconnected);
%       mlunit.assert_equals(0,self.eddiesObj.Isconnected);
%     end
%     
%     function self = test_csvinp_01_create( self )
%       mlunit.assert(isa(self.csvinpObj,'CanaryInput'));
%     end
%     
%     function self = test_csvinp_02_connect( self )
%       mlunit.assert_equals(0,self.csvinpObj.Isconnected);
%       mlunit.assert_equals(1,self.csvinpObj.Isconnected);
%     end
% 
%     function self = test_csvinp_03_initialize( self )
%       mlunit.assert_equals(0,self.csvinpObj.Isinitialized);
%       mlunit.assert_equals(0,self.csvinpObj.Isinitialized);
%       mlunit.assert_equals(1,self.csvinpObj.Isinitialized);
%     end      
% 
%     function self = test_csvinp_04_read_data( self )
%       mlunit.assert(nansum(nansum(self.csvinpObj.data.values(:,:)))~=0);
%     end
%     
%     function self = test_csvinp_05_disconnect( self )
%       mlunit.assert_equals(1,self.csvinpObj.Isconnected);
%       mlunit.assert_equals(0,self.csvinpObj.Isconnected);
%     end

  end
  
end
