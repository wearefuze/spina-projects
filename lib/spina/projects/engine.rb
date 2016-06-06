module Spina
  module Projects
    class Engine < ::Rails::Engine
      initializer 'spina.plugin.register.spina_projects', before: :load_config_initializers do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'Projects'
          plugin.namespace = 'projects'
        end
      end
    end
  end
end
