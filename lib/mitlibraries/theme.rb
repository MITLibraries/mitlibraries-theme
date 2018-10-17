require 'mitlibraries/theme/version'

module Mitlibraries
  module Theme
    module Rails
      class Engine < ::Rails::Engine
        config.assets.precompile += %w[favicon.ico mitlib-wordmark.svg]
      end
    end
  end
end
