class AddLoginTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login_type, :integer, default: 2, null: false
  end
end
