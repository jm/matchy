module Matchy
  module Expectations
    class RaiseErrorExpectation < Base
      def matches?(obj)
        begin
          obj.call
          return false
        rescue StandardError => e
          return false unless e.class.ancestors.include?(@object)
        
          return true
        end
      end
    end
    
    class ThrowSymbolExpectation < Base
      def matches?(obj)
        begin
          obj.call
        rescue NameError => e
          raise e unless e.message =~ /uncaught throw/
          thrown_symbol = e.name.to_sym
        ensure
          return @object == thrown_symbol
        end
      end
    end

    module TestCaseExtensions
      # Expects a lambda to raise an error.  You can specify the error or leave it blank to encompass
      # any error.
      #
      # ==== Examples
      #
      #   lambda { raise "FAILURE." }.should raise_error
      #   lambda { puts i_dont_exist }.should raise_error(NameError)
      #
      def raise_error(obj = StandardError)
        Matchy::Expectations::RaiseErrorExpectation.new(obj, self)
      end
      
      # Expects a lambda to throw an error.
      #
      # ==== Examples
      #
      #   lambda { throw :thing }.should throw_symbol(:thing)
      #   lambda { "not this time" }.should_not throw_symbol(:hello)
      #
      def throw_symbol(obj)
        Matchy::Expectations::ThrowSymbolExpectation.new(obj, self)
      end      
    end
  end
end