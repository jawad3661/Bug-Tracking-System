class RenameColumnsInProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :manager_id, :creator_id
  end
end
