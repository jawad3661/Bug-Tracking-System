class ChangeColumnsInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :availability , :boolean
    rename_column :users, :availability , :deactivated
  end

  def down
    rename_column :users, :deactivated , :availability
    change_column :users, :availability , :integer
  end
end
