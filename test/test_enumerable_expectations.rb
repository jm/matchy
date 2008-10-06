require File.dirname(__FILE__) + '/test_helper.rb'

class TestEnumerableExpectations < Test::Unit::TestCase
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
  
  # TODO: Test messages
end
