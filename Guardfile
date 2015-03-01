# encoding: utf-8

guard :rspec, cmd: "bundle exec rspec spec" do

  watch("lib/hexx-validators.rb") { "spec" }

  watch("lib/hexx/validators.rb") { "spec" }

  watch %r{^lib/hexx/validators/(\w+)\.rb$} do |m|
    "spec/tests/#{m[1]}_spec.rb"
  end

  watch(/^spec.+_spec\.rb$/)

  watch(%r{^spec/support/(.+)\.rb$}) { "spec" }

  watch("spec/spec_helper*.rb") { "spec" }
end
