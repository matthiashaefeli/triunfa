# Add date to group
class AddColumnDateToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :startdate, :date
    add_column :groups, :enddate, :date
  end
end
