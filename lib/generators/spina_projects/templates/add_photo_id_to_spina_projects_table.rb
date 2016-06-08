class AddPhotoIdToSpinaProjectsTable < ActiveRecord::Migration
  def change
    add_column :spina_projects, :photo_id, :integer
  end
end