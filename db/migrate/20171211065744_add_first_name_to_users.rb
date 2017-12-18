class AddFirstNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact, :integer, limit: 10
    add_column :users, :url, :string
  end
end
