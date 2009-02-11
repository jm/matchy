# Eval this file with ruby 1.9

require 'test/unit'
require "/Users/macbook/Projekte/matchy/lib/matchy.rb"

class TestAThing < Test::Unit::TestCase
  
  def setup
    @obj = Object.new
  end
  
  # ==
  def test_operator_eql_eql
    1.should == 1
  end
  
  def test_operator_eql_eql_fails
    lambda {1.should == 2}.should raise_error
  end
  
  def test_operator_eql_eql_negative
    1.should_not == 2
  end
  
  def test_operator_eql_eql_negative_fails
    lambda {1.should_not == 1}.should raise_error
  end
  
  # ===
  def test_operator_eql_eql_eql
    1.should === 1
  end
  
  def test_operator_eql_eql_eql_fails
    lambda {1.should === 2}.should raise_error
  end
  
  def test_operator_eql_eql_eql_negative
    1.should_not === 2
  end
  
  def test_operator_eql_eql_eql_negative_fails
    lambda {1.should_not === 1}.should raise_error
  end
  
  # =~
  def test_operator_eql_match
    "string".should =~ /in/
  end
  
  def test_operator_eql_match_fails
    lambda {"string".should =~ /an/}.should raise_error
  end
  
  def test_operator_eql_match_negative
    "string".should_not =~ /an/
  end
  
  def test_operator_eql_match_negative_fails
    lambda {"string".should_not =~ /in/}.should raise_error
  end
  
  # <=
  def test_operator_lt_eql
    1.should <= 2
  end
  
  def test_operator_lt_eql_fails
    lambda {1.should <= 0}.should raise_error
  end
  
  def test_operator_lt_eql_negative
    1.should_not <= 0
  end
  
  def test_operator_lt_eql_negative_fails
    lambda {1.should_not <= 2}.should raise_error
  end
  
  # >=
  def test_operator_gt_eql
    1.should >= 0
  end
  
  def test_operator_gt_eql_fails
    lambda {1.should >= 2}.should raise_error
  end
  
  def test_operator_gt_eql_negative
    1.should_not >= 2
  end
  
  def test_operator_gt_eql_negative_fails
    lambda {1.should_not >= 0}.should raise_error
  end
  
  # <
  def test_operator_lt
    1.should < 2
  end
  
  def test_operator_lt_fails
    lambda {1.should < 0}.should raise_error
  end
  
  def test_operator_lt_negative
    1.should_not < 0
  end
  
  def test_operator_lt_negative_fails
    lambda {1.should_not < 2}.should raise_error
  end
  
  # >
  def test_operator_gt
    1.should > 0
  end
  
  def test_operator_gt_fails
    lambda {1.should > 2}.should raise_error
  end
  
  def test_operator_gt_negative
    1.should_not > 2
  end
  
  def test_operator_gt_negative_fails
    lambda {1.should_not > 0}.should raise_error
  end
  
  # be()
  def test_be
    1.should be(1)
  end
  
  def test_be_fails
    lambda {1.should be(2)}.should raise_error
  end
  
  def test_be_negative
    1.should_not be(2)
  end
  
  def test_be_negative_fails
    lambda {1.should_not be(1)}.should raise_error
  end
  
  # be_something
  def test_positive_be_something_method_missing_pass
    def @obj.something?
      true
    end
    @obj.should be_something
  end
  
  def test_positive_be_something_method_missing_fails
    def @obj.something?
      false
    end
    lambda {@obj.should be_something}.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_be_something_method_missing_pass
    def @obj.something?
      false
    end
    @obj.should_not be_something
  end
  
  def test_negative_be_something_method_missing_fails
    def @obj.something?
      true
    end
    lambda {@obj.should_not be_something}.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_be_something_method_missing_fail_message
    obj = "foo"
    def obj.something?
      true
    end
    matcher_obj = be_something
    obj.should matcher_obj
    
    matcher_obj.failure_message.should be("Expected \"foo\" to return true for something?, with 'no args'.")
  end
  
  def test_be_something_method_missing_negative_fail_message
    obj = "foo"
    def obj.something?
      false
    end
    matcher_obj = be_something
    obj.should_not matcher_obj
    
    matcher_obj.negative_failure_message.should =~ /Expected \"foo\" to not return true for something?/
  end
  
  # be_something(arg)
  def test_positive_be_something_with_arg_method_missing_pass
    def @obj.something?(arg)
      true
    end
    @obj.should be_something(1)
  end
  
  def test_positive_be_something_with_arg_method_missing_fails
    def @obj.something?(arg)
      false
    end
    lambda {@obj.should be_something(1)}.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_be_something_method_missing_pass
    def @obj.something?(arg)
      false
    end
    @obj.should_not be_something(1)
  end
  
  def test_negative_be_something_method_missing_fails
    def @obj.something?(arg)
      true
    end
    lambda {@obj.should_not be_something(1)}.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_be_something_method_missing_fail_message
    obj = "foo"
    def obj.something?(arg)
      true
    end
    matcher_obj = be_something(1)
    obj.should matcher_obj
    
    matcher_obj.failure_message.should be("Expected \"foo\" to return true for something?, with '1'.")
  end
  
  def test_be_something_method_missing_negative_fail_message
    obj = "foo"
    def obj.something?(arg)
      false
    end
    matcher_obj = be_something(1)
    obj.should_not matcher_obj
    
    matcher_obj.negative_failure_message.should be("Expected \"foo\" to not return true for something?, with '1'.")
  end
  
  # change
  def test_change
    var = 1
    lambda {var += 1}.should change {var}
  end
  
  def test_change_fails
    var = 1
    lambda do
      lambda { }.should change {var} 
    end.should raise_error
  end
  
  def test_change_by
    var = 1
    lambda {var += 1}.should change {var}.by(1)
  end
  
  def test_change_by_fails
    var = 1
    lambda do
      lambda {var += 2}.should change {var}.by(1) 
    end.should raise_error
  end
  
  def test_change_by_at_least
    var = 1
    lambda {var += 1}.should change {var}.by_at_least(1)
  end
  
  def test_change_by_at_least_fails
    var = 1
    lambda do
      lambda {var += 0.9}.should change {var}.by_at_least(1)
    end.should raise_error
  end
  
  def test_change_by_at_most
    var = 1
    lambda {var += 1}.should change {var}.by_at_most(1)
  end
  
  def test_change_by_at_most_fails
    var = 1
    lambda do
      lambda {var += 1.1}.should change {var}.by_at_most(1)
    end.should raise_error
  end
  
  def test_change_from_to
    var = 1
    lambda {var += 1}.should change {var}.from(1).to(2)
  end
  
  def test_change_from_to_fails
    var = 1
    lambda do
      lambda {var += 1.1}.should change {var}.from(1).to(2)
    end.should raise_error
  end
  
  # def_matcher
  def test_def_matcher_defines_method
    def_matcher :method_ do |given, matcher, args|
    end
    self.should respond_to(:method_)
  end
  
  def test_def_matcher_object_responds_to_matches
    def_matcher :method_ do |given, matcher, args|
    end
    method_.should respond_to(:matches?)
  end
  
  def test_def_matcher_fail_positive
    def_matcher :matcher do |given, matcher, args|
      false
    end
    lambda {1.should matcher}.should raise_error
  end
  
  def test_def_matcher_pass_positive
    def_matcher :matcher do |given, matcher, args|
      true
    end
    1.should matcher
  end
  
  def test_def_matcher_fail_negative
    def_matcher :matcher do |given, matcher, args|
      true
    end
    lambda {1.should_not matcher}.should raise_error
  end
  
  def test_def_matcher_pass_negative
    def_matcher :matcher do |given, matcher, args|
      false
    end
    1.should_not matcher
  end
  
  def test_def_matcher_takes_arguments
    def_matcher :matcher do |given, matcher, args|
      $args = args
      true
    end
    @obj.should matcher(1,2,3)
    $args.should eql([1,2,3])
  end
  
  def test_def_matcher_received_method
    def_matcher :matcher do |given, matcher, args|
      $msgs = matcher.msgs
      true
    end
    @obj.should matcher.method1
    $msgs[0].name.should eql(:method1)
  end
  
  def test_def_matcher_received_method_takes_args
    def_matcher :matcher do |given, matcher, args|
      $msgs = matcher.msgs
      true
    end
    @obj.should matcher.method1(1,2,3)
    $msgs[0].args.should eql([1,2,3])
  end
  
  def test_def_matcher_received_method_takes_block
    def_matcher :matcher do |given, matcher, args|
      $msgs = matcher.msgs
      true
    end
    @obj.should matcher.method1 { "Hello, World!"}
    $msgs[0].block.call.should eql("Hello, World!")
  end
  
  def test_def_matcher_received_method_chained
    def_matcher :matcher do |given, matcher, args|
      $msgs = matcher.msgs
      true
    end
    @obj.should matcher.method1(1,2,3) { "Hello, World!"}.
      method2(4,5,6) { "Hello chained messages" }
      
    $msgs[0].name.should eql(:method1)
    $msgs[1].name.should eql(:method2)
    $msgs[0].args.should eql([1,2,3])
    $msgs[1].args.should eql([4,5,6])
    $msgs[0].block.call.should eql("Hello, World!")
    $msgs[1].block.call.should eql("Hello chained messages")
  end
  
  # include/exclude
  def test_include
    [1,2,3,4].should include(4)
  end
  
  def test_include_fail
    lambda {
      [1,2,3,4].should include(6)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_exclude
    [1,2,3,4].should exclude(9)
  end
  
  def test_exclude_fail
    lambda {
      [1,2,3,4].should exclude(4)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_multi_include
    [1,2,3,4].should include(1,2)
  end
  
  def test_multi_include_fail
    lambda {
      [1,2,3,4].should include(6,7,8)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_multi_exclude
    [1,2,3,4].should exclude(13,14)
  end
  
  def test_multi_exclude_fail
    lambda {
      [1,2,3,4].should exclude(2,3,4)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_include
    [1,2,3,4].should_not include(9)
  end
  
  def test_negative_include_fail
    lambda {
      [1,2,3,4].should_not include(4)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_exclude
    [1,2,3,4].should_not exclude(3)
  end
  
  def test_negative_exclude_fail
    lambda {
      [1,2,3,4].should_not exclude(6,7)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_include_fail_message
    obj = include(1)
    obj.matches?([4,5,6])
    
    obj.failure_message.should be("Expected [4, 5, 6] to include [1].")
  end
  
  def test_include_negative_fail_message
    obj = include(1)
    obj.matches?([4,5,6])
    
    obj.negative_failure_message.should be("Expected [4, 5, 6] to not include [1].")
  end
  
  def test_exclude_fail_message
    obj = exclude(4)
    obj.matches?([4,5,6])
    
    obj.failure_message.should be("Expected [4, 5, 6] to exclude [4].")
  end
  
  def test_exclude_negative_fail_message
    obj = exclude(4)
    obj.matches?([4,5,6])
    
    obj.negative_failure_message.should be("Expected [4, 5, 6] to not exclude [4].")
  end
  
  # raise_error
  def test_raises_error
    lambda { raise "FAIL" }.should raise_error
  end
  
  def test_raises_error_fail
    lambda {
      lambda { "WIN" }.should raise_error
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raise_error_negative_raises_error
    lambda { "WIN" }.should_not raise_error
  end
  
  def test_raise_error_negative_raises_error_fail
    lambda {
      lambda { raise "FAIL" }.should_not raise_error
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raise_error_raises_specific_error
    lambda { raise TypeError }.should raise_error(TypeError)
  end
  
  def test_raise_error_raises_specific_error_fail_with_no_error
    lambda {
      lambda { "WIN" }.should raise_error(TypeError)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raise_error_raises_specific_error_fail_with_different_error
    lambda {
      lambda { raise StandardError }.should raise_error(TypeError)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raise_error_error_fail_message
    obj = raise_error(TypeError)
    obj.matches?(lambda { raise NameError })
    
    obj.failure_message.should =~ /Expected #<(.*)> to raise TypeError, but NameError was raised instead./
  end
  
  def test_raise_error_error_fail_message_when_no_error
    obj = raise_error(TypeError)
    obj.matches?(lambda { "moop" })
    
    obj.failure_message.should =~ /Expected #<(.*)> to raise TypeError, but none was raised./
  end
  
  def test_raise_error_error_negative_fail_message
    obj = raise_error(TypeError)
    obj.matches?(lambda { raise TypeError })
    
    obj.negative_failure_message.should =~ /Expected #<(.*)> to not raise TypeError./
  end
  
  def test_raise_error_string_argument_message
    lambda {raise "message"}.should raise_error("message")
  end
  
  def test_string_argument_message_fails_no_error
    lambda do
      lambda { 1 }.should raise_error("message")
      
    end.should raise_error
  end
  
  def test_raise_error_string_argument_message_fails_wrong_message
    lambda do
      lambda { raise "other message" }.should raise_error("message")
    end.should raise_error
  end
  
  def test_raise_error_regexp_argument_message
    lambda {raise "message"}.should raise_error(/essa/)
  end
  
  def test_raise_error_regexp_argument_message_fails_no_error
    lambda do
      lambda { 1 }.should raise_error(/essa/)
    end.should raise_error
  end
  
  def test_raise_error_regexp_argument_message_fails_wrong_message
    lambda do
      lambda { raise "other message" }.should raise_error(/abc/)
    end.should raise_error(/matching/)
  end
  
  # throw
  def test_throws_symbol
    lambda {
      throw :win
    }.should throw_symbol(:win)
  end
  
  def test_throws_symbol_fails_with_different_symbol
    lambda {
      lambda {
        throw :fail
      }.should throw_symbol(:win)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_throws_symbol
    lambda {
      "not this time!"
    }.should_not throw_symbol(:win)
  end
  
  def test_negative_throws_symbol_fails_with_different_symbol
    
    lambda{
      lambda {
        throw :fail
      }.should_not throw_symbol(:fail)
    }.should raise_error(Test::Unit::AssertionFailedError)
  
  end
  
  def test_throw_fail_message
    obj = throw_symbol(:fail)
    obj.matches?(lambda { throw :lame })
    
    obj.failure_message.should =~ /Expected #<(.*)> to throw :fail, but :lame was thrown instead./
  end
  
  def test_throw_fail_message_when_no_symbol
    obj = throw_symbol(:fail)
    obj.matches?(lambda { "moop" })
    
    obj.failure_message.should =~ /Expected #<(.*)> to throw :fail, but no symbol was thrown./
  end
  
  def test_throw_negative_fail_message
    obj = throw_symbol(:fail)
    obj.matches?(lambda { throw :fail })
    
    obj.negative_failure_message.should =~ /Expected #<(.*)> to not throw :fail./
  end
end