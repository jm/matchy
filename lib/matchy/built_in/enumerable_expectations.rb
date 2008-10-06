module Matchy
  module Expectations 
    class IncludeExpectation < Base
      def matches?(obj)
        @object.each do |o|
          return false unless obj.include?(o)
        end
        
        true
      end
    end
    
    class ExcludeExpectation < Base
      def matches?(obj)
        @object.each do |o|
          return false unless !obj.include?(o)
        end
        
        true
      end
    end

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
        Matchy::Expectations::IncludeExpectation.new(obj, self)
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
        Matchy::Expectations::ExcludeExpectation.new(obj, self)
      end 
    end
  end
end