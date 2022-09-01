module Mitlibraries
  module Theme
    class Engine < ::Rails::Engine
      isolate_namespace Mitlibraries::Theme

      initializer "mitlibraries.theme.assets.precompile" do |app|
        app.config.assets.precompile += %w( favicon.ico mitlib-wordmark.svg vi-shape7-tp.svg libraries-main.css )
      end
    end
  end
end
