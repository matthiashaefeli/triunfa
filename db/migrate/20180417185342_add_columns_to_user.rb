# add columns street, city, state, cp and tel to user table
class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :cp, :integer
    add_column :users, :tel, :integer
  end
end
