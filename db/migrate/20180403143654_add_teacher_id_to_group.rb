# add teacher to group
class AddTeacherIdToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :teacher_id, :integer
  end
end
