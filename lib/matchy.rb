$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'test/unit'

require 'matchy/modals'
require 'matchy/version'
require 'matchy/matcher_builder'
require 'matchy/def_matcher'

require 'matchy/built_in/enumerable_expectations'
require 'matchy/built_in/error_expectations'
require 'matchy/built_in/truth_expectations'
require 'matchy/built_in/operator_expectations'
require 'matchy/built_in/change_expectations'

Test::Unit::TestCase.send(:include, Matchy::Expectations::TestCaseExtensions)

include Matchy::DefMatcher

