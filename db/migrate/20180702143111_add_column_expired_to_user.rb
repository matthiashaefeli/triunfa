class AddColumnExpiredToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :expired, :date, default: "2018-01-01"
  end
end
