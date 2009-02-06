module Matchy
  module Expectations
    # Class to handle operator expectations.
    #
    # ==== Examples
    #   
    #   13.should == 13
    #   "hello".length.should_not == 2
    #
    class OperatorExpectation < Base 
      OPERATORS = ['==', '===', '=~', '>', '>=', '<', '<=']
           
      def initialize(receiver, match)
        @receiver = receiver
        @match = match
      end
      
      OPERATORS.each do |op|
        define_method(op) do |expected|
          @expected = expected
          (@receiver.send(op,expected) ? true : false) == @match ? pass! : fail!(op)
        end
      end
      
      protected
      def pass!
        assert true
      end
      
      def fail!(operator)
        flunk @match ? failure_message(operator) : negative_failure_message(operator)
      end
      
      def failure_message(operator)
        "Expected #{@receiver.inspect} to #{operator} #{@expected.inspect}."
      end
      
      def negative_failure_message(operator)
        "Expected #{@receiver.inspect} to not #{operator} #{@expected.inspect}."
      end
    end
  end
end