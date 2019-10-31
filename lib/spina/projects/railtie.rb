module Spina
  module Projects
    class Railtie < Rails::Railtie

      initializer "spina_projects.assets.precompile" do |app|
        app.config.assets.precompile += %w(spina/projects/admin/projects.js spina/projects/admin/projects.css)
      end

    end
  end
end
