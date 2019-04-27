class CreateSpinaProjectCategoriesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :spina_project_categories do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
