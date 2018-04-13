class AddColumnSecondUserToTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :seconduser, :integer
  end
end
