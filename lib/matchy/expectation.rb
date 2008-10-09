module Matchy
  module Expectations
    # Base class for all expectations.  Inheriting from this DRYs up a lot of the
    # constructor logic, etc.
    #
    # TODO: Implement failure messages, inluding negative failure messages.  Also,
    # need to name variables/parameters to go with testing nomenclature (expected rather
    # than just "object").
    class Base
      include Test::Unit::Assertions
      
      # Takes object to match against and the test_case we're in so we can feed it the 
      # successes/failures.
      def initialize(obj, test_case)
        @object = obj
        @test_case = test_case
      end
    
      # Match the given objects against some logic.  This raises an error in Base because
      # each matcher (obviously) has to implement its own logic.
      def matches?(obj)
        raise "Please provide logic to match your expectation to an object!  OR ELSE."
      end
    
      # Fail the expectation.  Calls flunk on the test case.
      def fail!
        @test_case.flunk failure_message
      end
      
      # Pass the expectations.  Calls <tt>assert true</tt>.  May want to consider something
      # different here.
      def pass!
        @test_case.assert true
      end
      
      # Failure message.  Should be overriden.
      def failure_message
        "OMG FAIL."
      end
    end
  end
end