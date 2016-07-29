class AddCompletionDateToSpinaProjects < ActiveRecord::Migration
  def change
    add_column :spina_projects, :completion_date, :datetime
  end
end
