class AddPhotoCollectionIdToProjectsTable < ActiveRecord::Migration
  def change
    add_column :spina_projects, :photo_collection_id, :integer
  end
end
