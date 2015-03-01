$:.push File.expand_path("../lib", __FILE__)
require "hexx/validators/version"

Gem::Specification.new do |s|
  s.name        = "hexx-validators"
  s.version     = Hexx::Validators::VERSION.dup
  s.author      = "Andrew Kozin"
  s.email       = "andrew.kozin@gmail.com"
  s.homepage    = "https://github.com/nepalez/hexx"
  s.summary     = "Scaffolder for custom validators."
  s.description = "Thor-based generator of an ActiveModel validators" \
                  "and its unit test templates."
  s.license     = "MIT"

  s.require_paths    = ["lib"]
  s.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files       = Dir["spec/**/*.rb"]
  s.extra_rdoc_files = Dir["README.md", "LICENSE", "config/metrics/STYLEGUIDE"]

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = "~> 2.1"

  s.add_runtime_dependency "hexx", "~> 8.0"
end
