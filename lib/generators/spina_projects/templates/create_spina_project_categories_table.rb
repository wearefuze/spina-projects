class CreateSpinaProjectCategoriesTable < ActiveRecord::Migration
  def change
    create_table :spina_project_categories do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
