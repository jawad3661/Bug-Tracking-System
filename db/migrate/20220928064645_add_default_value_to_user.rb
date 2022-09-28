class AddDefaultValueToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_type, :string, default: 'User'
  end
end
