# encoding: utf-8

# ==============================================================================
# Definition of validator spec matchers
# ==============================================================================
require "active_model"

# Checks that custom validator object fails with given value assigned to the
# +name+ attribute.
#
# @example
#   subject { MyValidator.new attributes: :name }
#   expect(subject).to fail_with some_value, key: :invalid
#
# @param [Object] value The value to check against.
# @param [Symbol] key The key for the required I18n error message.
RSpec::Matchers.define :fail_with do |value, key: nil|
  match do |validator|
    record = spy :record, errors: Hexx::NULL
    validator.validate_each(record, :name, value)
    expect(record).to have_received(:errors) do |_, error_key, *|
      expect(error_key).to eq key if key
    end
  end
end

# Checks that custom validator object passes with given value assigned to the
# +name+ attribute.
#
# @example
#   subject { MyValidator.new attributes: :name }
#   expect(subject).to pass_with some_value
#
# @param [Object] value The value to check against.
RSpec::Matchers.define :pass_with do |value|
  match do |validator|
    record = spy :record, errors: Hexx::NULL
    validator.validate_each(record, :name, value)
    expect(record).not_to have_received(:errors)
  end
end
