# encoding: utf-8

# Loads the RSpec test suit.
require "hexx-rspec"

# Loads runtime metrics in the current scope
Hexx::RSpec.load_metrics_for(self)

# Loads the code of the module.
require "hexx-validators"
