module Matchy
  module ExpectationBuilder
    def self.build_expectation(type, exp, obj)
      if exp
        match_expectation(exp, (type == :should), obj)
      else
        return Matchy::Expectations::OperatorExpectation.new(obj, (type == :should))
      end
    end
    
    def self.match_expectation(expectation, match, obj)
      if expectation.matches?(obj) != match
        expectation.fail!(match)
      else
        expectation.pass!(match)
      end
    end
  end
end