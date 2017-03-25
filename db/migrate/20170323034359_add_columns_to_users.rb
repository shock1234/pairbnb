class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :birthday, :date
  end
end
