# Mitlibraries::Theme

Provides base CSS and Images used by MIT Libraries for our websites.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mitlibraries-theme'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install mitlibraries-theme
```

## Usage

### Controllers

The gem includes a link helper class, which provides a function - `nav_link_to` - which renders links with particular classes and ARIA roles that are suited for site navigation. The default navigation partial at `app/views/layouts/_site_nav.html.erb` makes use of this function, and we recommend you copy this partial into your application with appropriate updates for your app.

In order to make this function available to your application, please add the following line near the top of your local `app/controllers/application_controller.rb`:

```ruby
helper Mitlibraries::Theme::Engine.helpers
```

### Layouts and stylesheets

After you update your controller and bundle, delete your application local `app/views/layouts/application.rb` to use the layout the gem provides.

Rename your `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.scss` and remove anything like:

```ruby
*= require_tree .
*= require_self
```

Add
`@import "libraries-main";`

If you have local overrides for styles, import them _after_ the shared styles.

You'll want to set `<%= content_for(:title, "SOMETHING") %>` on your views.

You'll want to copy `app/views/layouts/_site_nav.html.erb` into your local
repo and make appropriate changes.

`app/views/layouts/_site_footer.html.erb` is also available if you really need
a third footer above the other two (I'm looking at you bento!).

`app/views/layouts/_skip_links.html.erb` provides the option to change the href or text for the skip link, or include
multiple skip links if needed.

If you need to make changes to other templates, you can also copy those to your local repo but you should check with others as the main header / footer / etc are probably best left as they are in this gem.

## Adding Additional JavaScript to HTML Head

You can load additional js to individual pages using:

```ruby
<% content_for :additional_js do %>
  <script>alert("hi");</script>
<% end %>
```

This can appear as many times as you need on as many templates as you need. If
called multiple times the results are concatenated. This is intended primarily
for adding external support libraries. For JS you are writing, include via
`application.scss` as normal.

## Adding Additional Meta headers to HTML Head

You can load additional meta headers to individual pages using:

```ruby
<% content_for :additional_meta_tag do %>
  <meta name="description" content="Words and stuff about stuff or something.">
  <meta name="keywords" content="words,stuff,yoyos">
<% end %>
```

This can appear as many times as you need on as many templates as you need. If
called multiple times the results are concatenated.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Building and publishing this gem is handled via the `Makefile`.

Run `make help` for details.

If your goal is to fetch the latest assets from the style repo and publish the
changes, this would get you there:

- `make update`
- manually update the version in `lib/mitlibraries/theme/version.rb`
- `make dist`
- test the gem in a local version of a site that uses it with the info the previous command provided on completion
- commit and PR
- `make publish`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MITLibraries/mitlibraries-theme. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mitlibraries::Theme project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/MITLibraries/mitlibraries-theme/blob/master/CODE_OF_CONDUCT.md).
