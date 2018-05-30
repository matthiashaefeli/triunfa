# add columns name and lastname to user table
class AddNameAndLastNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
  end
end
