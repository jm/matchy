require File.dirname(__FILE__) + '/test_helper.rb'

class Exister
  def initialize(what)
    @what = what
  end
  
  def exist?
    @what
  end
end

class TestTruthExpectations < Test::Unit::TestCase
  def test_equal
    3.should equal(3)
  end

  def test_negative_equal
    instance = String.new
    
    instance.should_not equal(String.new)
  end
  
  def test_equal_fail
    lambda {
      3.should equal(4)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_equal_fail
    lambda {
      3.should_not equal(3)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end

  def test_eql
    3.should eql(3)
  end
  
  def test_negative_eql
    3.should_not eql(9)
  end
  
  def test_eql_fail
    lambda {
      3.should eql(13)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_eql_fail
    lambda {
      3.should_not eql(3)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_exists
    thing = Exister.new(true)
    thing.should exist
  end
  
  def test_negative_exists
    thing = Exister.new(false)
    thing.should_not exist
  end
  
  def test_exists_fail
    lambda {
      thing = Exister.new(false)
      thing.should exist
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_exists_fail
    lambda {
      thing = Exister.new(true)
      thing.should_not exist
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_be
    true.should be(true)
  end
  
  def test_negative_be
    true.should_not be(false)
  end
  
  def test_be_fail
    lambda {
      true.should be(false)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_be_close
    lambda {
      true.should_not be(true)
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_satisfy
    13.should satisfy(lambda {|i| i < 15})
  end
  
  def test_negative_satisfy
    13.should_not satisfy(lambda {|i| i < 10})
  end
  
  def test_satisfy_fail
    lambda {
      13.should satisfy(lambda {|i| i > 15})
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
  
  def test_negative_satisfy_fail
    lambda {
      13.should_not satisfy(lambda {|i| i < 15})
    }.should raise_error(Test::Unit::AssertionFailedError)
  end
end
