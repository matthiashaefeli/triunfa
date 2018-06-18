# Add days to group
class AddColumnDaysToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :days, :text, array: true, default: []
  end
end
