require 'rails/generators/base'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module SpinaProjects
  module Generators
    class InstallGenerator < Rails::Generators::Base

      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      def copy_migration_file
        migration_template "create_spina_projects_table.rb", Rails.root.join("db/migrate/create_spina_projects_table.rb")
        migration_template "create_spina_project_categories_table.rb", Rails.root.join("db/migrate/create_spina_project_categories_table.rb")
        migration_template "add_photo_collection_id_to_projects_table.rb", Rails.root.join("db/migrate/add_photo_collection_id_to_projects_table.rb")
        migration_template "add_photo_id_to_spina_projects_table.rb", Rails.root.join("db/migrate/add_photo_id_to_spina_projects_table.rb")
        migration_template "add_completion_date_to_spina_projects.rb", Rails.root.join("db/migrate/add_completion_date_to_spina_projects.rb")
      end

    end
  end
end