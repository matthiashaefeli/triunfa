# change integer limit
class ChangeIntegerLimitInUserModel < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :tel, :integer, limit: 8
    change_column :users, :cp, :integer, limit: 8
  end
end
