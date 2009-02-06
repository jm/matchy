module Matchy
  module MatcherBuilder
    def build_matcher(matcher_name=nil, args=[], &block)
      #args = [args] #unless args.kind_of?(Array)
      match_block = lambda do |actual, matcher|
        block.call(actual, matcher, args)
      end
      body = lambda do |klass|
        @matcher_name = matcher_name.to_s
        def self.matcher_name
          @matcher_name
        end

        attr_accessor :positive_msg, :negative_msg, :msgs
        attr_reader :matcher_name
        def initialize match_block, test_case
          @test_case = test_case
          @match_block = match_block
          @matcher_name = self.class.matcher_name
        end

        def method_missing id, *args, &block
          require 'ostruct'
          (self.msgs ||= []) << OpenStruct.new( "name" => id, "args" => args, "block" => block ) 
          self
        end

        def matches? given
          @positive_msg ||= "Matching with '#{matcher_name}' failed, although it should match."
          @negative_msg ||= "Matching with '#{matcher_name}' passed, although it should_not match."
          @match_block.call(given, self)
        end

        def failure_message
          self.positive_msg
        end

        def negative_failure_message
          self.negative_msg
        end
      end
      Class.new(Matchy::Expectations::Base, &body).new(match_block, self)
    end
  end
end