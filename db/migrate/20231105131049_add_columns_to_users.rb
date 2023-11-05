class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :email_address, :string
    add_column :users, :password, :string
  end
end
