module Matchy
  module Expectations
    module TestCaseExtensions
      # Expects a lambda to raise an error.  You can specify the error or leave it blank to encompass
      # any error.
      #
      # ==== Examples
      #
      #   lambda { raise "FAILURE." }.should raise_error
      #   lambda { puts i_dont_exist }.should raise_error(NameError)
      #
      def raise_error(*obj)
        build_matcher(:raise_error, obj) do |receiver, matcher, args|
          @receiver = receiver
          expected = args[0] || StandardError
          raised = false
          error = nil
          begin
            @receiver.call
          rescue StandardError => e
            raised = true
            error = e
          end
          
          if expected.respond_to?(:ancestors) && expected.ancestors.include?(Exception)
            extra = "but none was raised"
            extra = "but #{error.class.name} was raised instead" if error
            matcher.positive_msg = "Expected #{@receiver.inspect} to raise #{expected.name}, #{extra}."
            matcher.negative_msg = "Expected #{@receiver.inspect} to not raise #{expected.name}."
            comparison = (raised && error.class.ancestors.include?(expected))
          else
            message = error ? error.message : "none"
            matcher.positive_msg = "Expected #{@receiver.inspect} to raise error with message matching '#{expected}', but '#{message}' was raised."
            matcher.negative_msg = "Expected #{@receiver.inspect} to raise error with message not matching '#{expected}', but '#{message}' was raised."
            comparison = (raised && (expected.kind_of?(Regexp) ? ((error.message =~ expected) ? true : false) : expected == error.message))
          end
          comparison
        end
      end
      
      # Expects a lambda to throw an error.
      #
      # ==== Examples
      #
      #   lambda { throw :thing }.should throw_symbol(:thing)
      #   lambda { "not this time" }.should_not throw_symbol(:hello)
      #
      def throw_symbol(*obj)
        build_matcher(:throw_symbol, obj) do |given, matcher, args|
          raised = false
          thrown_symbol = nil
          begin
            given.call
          rescue NameError => e
            raise e unless e.message =~ /uncaught throw/
            raised = true
            thrown_symbol = e.name.to_sym
          end
          expected = args[0]
          matcher.positive_msg = <<-END
Expected #{given.inspect} to throw :#{expected}, but \
#{thrown_symbol ? ':' + thrown_symbol.to_s + ' was thrown instead' : 'no symbol was thrown'}.
END
          matcher.negative_msg = "Expected #{given.inspect} to not throw :#{expected}."
          expected == thrown_symbol
        end
      end      
    end
  end
end