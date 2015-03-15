# encoding: utf-8

module Hexx

  module Validators

    # Scaffolder for a custom validator creates:
    #
    # * scope class definition in `app/validators`;
    # * scope specification in `spec/tests/validators`.
    #
    class Generator < Hexx::CLI::Base

      # @!scope class
      # @!method start(arguments)
      # Runs the scaffolder with a list of arguments from CLI.
      # @param  [Array<String>] arguments The list of arguments from CLI.
      # @return [undefined]

      # Root folder for the generator's templates and description.
      # @return [String] The absolute path to folder.
      # @api private
      def self.source_root
        ::File.expand_path "../generator", __FILE__
      end

      namespace :validator
      desc      "Scaffolds a custom validator with unit test and translations."

      argument(
        :name,
        describe: "The name of the validator",
        banner: "NAME",
        type: :string
      )

      class_option(
        :options,
        aliases: "-o",
        default: [],
        describe: "The list of validator options",
        type: :array
      )

      class_option(
        :errors,
        aliases: "-e",
        default: [],
        describe: "The list of error keys for I18n translations",
        type: :array
      )

      # @private
      def add_support
        directory "support", "spec/support", skip: true
      end

      # @private
      def add_specification
        template "spec.erb", "spec/tests/#{ validator.path }_spec.rb"
      end

      # @private
      def add_declaration
        template "validator.erb", "app/#{ validator.path }.rb"
      end

      private

      def project
        @project ||= Hexx::CLI::Name.new ::File.basename(destination_root)
      end

      def validator
        @validator ||= Hexx::CLI::Name.new "validators/#{ name }"
      end

      def keys
        @keys ||= options["errors"].map(&:snake_case)
      end

      def params
        @params ||= options["options"]
      end

    end # class Generator

  end # module Validators

end # module Hexx
