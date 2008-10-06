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
      def initialize(obj, match)
        @object = obj
        @match = match
      end

      def ==(obj)
        if @object.send(:==, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      def ===(obj)
        if @object.send(:===, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      def =~(obj)
        if @object.send(:=~, obj).nil? != @match
          pass!
        else
          fail!
        end
      end
      
      def >(obj)
        if @object.send(:>, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      def <(obj)
        if @object.send(:<, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      def >=(obj)
        if @object.send(:>=, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      def <=(obj)
        if @object.send(:<=, obj) == @match
          pass!
        else
          fail!
        end
      end
      
      protected
      def pass!
        assert true
      end
      
      def fail!
        flunk
      end
    end
  end
end