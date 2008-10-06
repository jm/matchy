require File.dirname(__FILE__) + '/test_helper.rb'

class TestExpectationBase < Test::Unit::TestCase
  def setup
    @instance = Matchy::Expectations::Base.new(true, self)
  end
  
  def test_ivars
    @instance.instance_variable_get("@object").should eql(true)
  end
  
  def test_matches_throws_error
    lambda {
      @instance.matches?(true)
    }.should raise_error
  end
  
  def test_fail_should_raise
    lambda {
      @instance.fail!
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_succeed
    @instance.succeed!
  end
  
  def test_failure_message
    @instance.failure_message.should eql("OMG FAIL.")
  end
end
