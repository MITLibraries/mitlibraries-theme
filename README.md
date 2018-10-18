# Mitlibraries::Theme

Provides base CSS and Images used by MIT Libraries for our websites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mitlibraries-theme'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mitlibraries-theme

## Usage

After you bundle, delete your application local `app/views/layouts/application.rb` to use the layout the gem provides.

Rename your `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.scss` and remove anything like:
```
*= require_tree .
*= require_self
```
Add
`@import "libraries-main";`

If you have local overrides for styles, import them _after_ the shared styles.

You'll want to set `<%= content_for(:title, "SOMETHING") %>` on your views.

You'll want to copy `app/views/layouts/_site_nav.html.erb` into your local repo and make appropriate changes.

If you need to make changes to other templates, you can also copy those to your local repo but you should check with others as the main header / footer / etc are probably best left as they are in this gem.

## Adding Additional JavaScript to HTML Head

You can load additional js to individual pages using:

```
<% content_for :additional_js do %>
  <script>alert("hi");</script>
<% end %>
```

This can appear as many times as you need on as many templates as you need. If
called multiple times the results are concatenated. This is intended primarily
for adding external support libraries. For JS you are writing, include via
`application.scss` as normal.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MITLibraries/mitlibraries-theme. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mitlibraries::Theme project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/MITLibraries/mitlibraries-theme/blob/master/CODE_OF_CONDUCT.md).
