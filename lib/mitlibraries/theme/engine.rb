module Mitlibraries
  module Theme
    class Engine < ::Rails::Engine
      isolate_namespace Mitlibraries::Theme
    end
  end
end
