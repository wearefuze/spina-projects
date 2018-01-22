module Spina
  module Projects
    class Engine < ::Rails::Engine
      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'projects'
          plugin.namespace = 'projects'
        end
      end
    end
  end
end
