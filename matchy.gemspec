Gem::Specification.new do |s|
  s.name     = "matchy"
  s.version  = "0.0.1"
  s.date     = "2008-10-05"
  s.summary  = "RSpec-esque matchers for use in Test::Unit"
  s.email    = "jeremy@entp.com"
  s.homepage = "http://github.com/jeremymcanally/matchy"
  s.description = "Hate writing assertions?  Need a little behavior-driven love in your tests?  Then matchy is for you."
  s.has_rdoc = true
  s.authors  = ["Jeremy McAnally"]
  s.files    = [
    "History.txt", 
  	"Manifest.txt", 
  	"README.rdoc", 
  	"Rakefile", 
  	"context.gemspec", 
    "History.txt",
    "License.txt",
    "Manifest.txt",
    "PostInstall.txt",
    "README.markdown",
    "Rakefile",
    "config/hoe.rb",
    "config/requirements.rb",
    "lib/matchy.rb",
    "lib/matchy/version.rb",
    "lib/matchy/expectation.rb",
    "lib/matchy/models.rb",
    "lib/matchy/built_in/enumerable_expectations.rb",
    "lib/matchy/built_in/error_expectations.rb",
    "lib/matchy/built_in/operator_expectations.rb",
    "lib/matchy/built_in/truth_expectations.rb",
    "setup.rb"
  ]
  
  s.test_files = [
    "test/test_context.rb",
    "test/test_core_ext.rb",
    "test/test_lifecycle.rb",
    "test/test_test.rb",
    "test/test_helper.rb"
  ]

  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
end