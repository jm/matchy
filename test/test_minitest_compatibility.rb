require 'rubygems'
require 'minitest/unit'
load File.dirname(__FILE__) + '/../lib/matchy.rb'

MiniTest::Unit.autorun

class TestAThing < MiniTest::Unit::TestCase
  def test_a_thing
    1.should == 1
  end
end