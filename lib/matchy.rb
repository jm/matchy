$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'test/unit'

require 'matchy/expectation_builder'
require 'matchy/modals'
require 'matchy/version'
require 'matchy/matcher_builder'
require 'matchy/def_matcher'

require 'matchy/built_in/enumerable_expectations'
require 'matchy/built_in/error_expectations'
require 'matchy/built_in/truth_expectations'
require 'matchy/built_in/operator_expectations'
require 'matchy/built_in/change_expectations'

# Evil test/unit hack.
# Track the current testcase and 
# provide it to the operator matchers.
class Test::Unit::TestCase
  alias_method :old_run_method_aliased_by_matchy_300, :run
  def run(whatever, *args, &block)
    $current_test_case = self
    old_run_method_aliased_by_matchy_300(whatever, *args, &block)
  end
end

Test::Unit::TestCase.send(:include, Matchy::Expectations::TestCaseExtensions)

include Matchy::DefMatcher

