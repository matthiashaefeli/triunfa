# add finished to assignment
class AddColumnToFinishedAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :finished_assignments, :group_id, :integer
  end
end
