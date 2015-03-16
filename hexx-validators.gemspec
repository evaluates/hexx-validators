$:.push File.expand_path("../lib", __FILE__)
require "hexx/validators/version"

Gem::Specification.new do |gem|

  gem.name        = "hexx-validators"
  gem.version     = Hexx::Validators::VERSION.dup
  gem.author      = "Andrew Kozin"
  gem.email       = "andrew.kozin@gmail.com"
  gem.homepage    = "https://github.com/nepalez/hexx"
  gem.summary     = "Scaffolder for custom validators."
  gem.description = "Thor-based generator of an ActiveModel validators" \
                  "and its unit test templates."
  gem.license     = "MIT"

  gem.require_paths    = ["lib"]
  gem.files            = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files       = Dir["spec/**/*.rb"]
  gem.extra_rdoc_files = Dir["README.md", "LICENSE"]

  gem.required_ruby_version = "~> 2.0"
  gem.add_runtime_dependency "hexx-cli", "~> 0.0"
  gem.add_development_dependency "hexx-rspec", "~> 0.3"

end
