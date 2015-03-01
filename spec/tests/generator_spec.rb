# encoding: utf-8

# See additional helpers and matchers for :sandbox and :capture tagged specs
# in the config/initializers folder of the 'hexx' gem.
describe Hexx::Validators::Generator, :sandbox, :capture do

  describe ".start" do

    shared_examples "adding support files" do

      before { subject }

      it "[creates file]" do
        expect("spec/support/config/validator.rb").to be_present_in_sandbox
        expect("spec/support/validators/matchers.rb").to be_present_in_sandbox
      end

    end # examples

    shared_examples "adding specification" do

      let(:file) { "spec/tests/validators/in_the_past_spec.rb" }
      before { subject }

      it "[creates file]" do
        expect(file).to be_present_in_sandbox
      end

      it "[describes validator]" do
        content = read_in_sandbox(file)
        expect(content).to include "describe Sandbox::Validators::InThePast"
      end

    end # examples

    shared_examples "adding validator" do

      let(:file) { "app/validators/in_the_past.rb" }
      before     { subject }

      it "[creates a file]" do
        expect(file).to be_present_in_sandbox
      end

      it "[defines a validator]" do
        content    = read_in_sandbox(file)
        definition = "class InThePast < ActiveModel::EachValidator"
        expect(content).to include definition
      end

    end # examples

    subject do
      try_in_sandbox { described_class.start %w(in_the_past).concat opts }
    end

    context "in_the_past" do

      let(:opts) { %w() }

      it_behaves_like "adding support files"
      it_behaves_like "adding specification"
      it_behaves_like "adding validator"

    end # context

    context "in_the_past -e not_in_the_past" do

      let(:opts) { %w(-e not_in_the_past) }

      it_behaves_like "adding support files"
      it_behaves_like "adding specification"
      it_behaves_like "adding validator"

      it "adds check-outs for errors" do
        subject
        content = read_in_sandbox  "app/validators/in_the_past.rb"
        expect(content).to include "def not_in_the_past?"
      end

    end # context

  end # describe .start

end # describe Hexx::Validators::Generator
