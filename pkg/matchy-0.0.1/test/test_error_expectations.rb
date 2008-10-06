require File.dirname(__FILE__) + '/test_helper.rb'

class TestErrorExpectations < Test::Unit::TestCase
  def test_raises_error
    lambda { raise "FAIL" }.should raise_error
  end
  
  def test_raises_error_fail
    lambda {
      lambda { "WIN" }.should raise_error
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_raises_error
    lambda { "WIN" }.should_not raise_error
  end
  
  def test_negative_raises_error_fail
    lambda {
      lambda { raise "FAIL" }.should_not raise_error
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raises_specific_error
    lambda { raise TypeError }.should raise_error(TypeError)
  end
  
  def test_raises_specific_error_fail_with_no_error
    lambda {
      lambda { "WIN" }.should raise_error(TypeError)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_raises_specific_error_fail_with_different_error
    lambda {
      lambda { raise StandardError }.should raise_error(TypeError)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
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
end
