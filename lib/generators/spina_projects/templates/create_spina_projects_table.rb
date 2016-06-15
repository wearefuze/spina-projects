class CreateSpinaProjectsTable < ActiveRecord::Migration
  def change
    create_table :spina_projects do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :lat
      t.string :long
      t.string :duration
      t.integer :project_category_id
      t.text :testimonial
      t.string :testimonial_name
      t.timestamps
    end
  end
end
