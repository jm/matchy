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
        build_matcher(:raise_error, obj) do |given, matcher, args|
          raised = false
          error = nil
          begin
            given.call
          rescue StandardError => e
            raised = true
            error = e
          end
          extra = "but none was raised"
          extra = "but #{error.class.name} was raised instead" if error
          expected_error = args[0] || StandardError
          matcher.positive_msg = "Expected #{given.inspect} to raise #{expected_error.name}, #{extra}."
          matcher.negative_msg = "Expected #{given.inspect} to not raise #{expected_error.name}."
          raised && error.class.ancestors.include?(expected_error)
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