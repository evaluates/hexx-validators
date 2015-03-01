# Hexx::Validators

[![Gem Version](https://img.shields.io/gem/v/hexx-validators.svg?style=flat)][gem]
[![Build Status](https://img.shields.io/travis/nepalez/hexx-validators/master.svg?style=flat)][travis]
[![Dependency Status](https://img.shields.io/gemnasium/nepalez/hexx-validators.svg?style=flat)][gemnasium]
[![Code Climate](https://img.shields.io/codeclimate/github/nepalez/hexx-validators.svg?style=flat)][codeclimate]
[![Coverage](https://img.shields.io/coveralls/nepalez/hexx-validators.svg?style=flat)][coveralls]
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

[MIT LICENSE]: file:./LICENSE
[codeclimate]: https://codeclimate.com/github/nepalez/hexx-validators
[coveralls]: https://coveralls.io/r/nepalez/hexx-validators
[gem]: https://rubygems.org/gems/hexx-validators
[gemnasium]: https://gemnasium.com/nepalez/hexx-validators
[travis]: https://travis-ci.org/nepalez/hexx-validators

The [Thor-based](https://github.com/erikhuda/thor) scaffolder of custom ActiveModel validators with unit test and its support files.

The module is the part of [hexx] scaffolders collection.

## Installation

Add this line to your application's Gemfile:

```ruby
    gem "hexx-validators"
```

And then execute:

```
    $ bundle
```

Or install it yourself as:

```
    $ gem install hexx-validators
```

## Usage

```ruby
require "hexx-validators"

Hexx::Validators::Generator.start %w(
    in_the_past
    -o allow_nil time_zone
    -e not_in_the_past
)
```

### Arguments and Options

The generator takes one argument (the name of the validator, such as `in_the_past`) and two options:

* `-o` - the names of validator options (such as allow_nil etc.).
* `-e` - the names of error messages for I18n translations.

Depending on options the unit test spec will be pre-populated with combinations of options.

### Provided Results

The generator creates:

* the validator (`app/validators/in_the_past.rb`)
  by convention I follow, it will be namespaced correspondingly: `MyGem::Validators::InThePast`.
* the unit test specification `spec/tests/validators/in_the_past_spec.rb`.

## Compatibility

Tested under MRI rubies >= 2.1. Rubies under 2.1 aren't supported.

Uses [RSpec] 3.0+ for testing and [hexx-suit] for dev/test tools collection.

## Contributing

* Fork the project.
* Read the [STYLEGUIDE](config/metrics/STYLEGUIDE).
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## License

See [MIT LICENSE](LICENSE).
