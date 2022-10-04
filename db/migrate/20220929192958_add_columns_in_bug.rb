class AddColumnsInBug < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :creator_id, :integer
    add_column :bugs, :solver_id, :integer
    add_column :bugs, :project_id, :integer
  end
end
