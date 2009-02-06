module Matchy
  module Expectations 
    module TestCaseExtensions
      
      # Calls +include?+ on the receiver for any object.  You can also provide
      # multiple arguments to see if all of them are included.
      #
      # ==== Examples
      #   
      #   [1,2,3].should include(1)
      #   [7,8,8].should_not include(3)
      #   ['a', 'b', 'c'].should include('a', 'c')
      #
      def include(*obj)
        build_matcher(:include, obj) do |given, matcher, args|
          matcher.positive_msg = "Expected #{given.inspect} to include #{args.inspect}."
          matcher.negative_msg = "Expected #{given.inspect} to not include #{args.inspect}."
          args.inject(true) {|m,o| m && given.include?(o) }
        end
      end
      
      # Expects the receiver to exclude the given object(s). You can provide
      # multiple arguments to see if all of them are included.
      #
      # ==== Examples
      #   
      #   [1,2,3].should exclude(16)
      #   [7,8,8].should_not exclude(7)
      #   ['a', 'b', 'c'].should exclude('e', 'f', 'g')
      #
      def exclude(*obj)
        build_matcher(:exlude, obj) do |given, matcher, args|
          matcher.positive_msg = "Expected #{given.inspect} to exclude #{args.inspect}."
          matcher.negative_msg = "Expected #{given.inspect} to not exclude #{args.inspect}."
          args.inject(true) {|m,o| m && !given.include?(o) }
        end
      end
    end
  end
end