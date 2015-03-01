# encoding: utf-8

# Loads the RSpec test suit.
require "hexx-suit"

# Loads runtime metrics in the current scope
Hexx::Suit.load_metrics_for(self) if ENV["USE_METRICS"]

# Loads the RSpec support files.
Dir.chdir File.expand_path("..", __FILE__) do
  Dir["./support/config/*.rb"].each { |file| require file }
end

# Loads the code of the module.
require "hexx-validators"
