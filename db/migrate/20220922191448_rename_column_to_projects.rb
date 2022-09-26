class RenameColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :user_id, :manager_id
  end
end
