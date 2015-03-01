# encoding: utf-8

# Includes specific helpers and matchers for validator specs
RSpec.configure do |config|
  config.before :each, type: :validator do
    require_relative "../validators/matchers"
  end
end
