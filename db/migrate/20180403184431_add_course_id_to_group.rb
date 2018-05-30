# add columnd course_id to group table
class AddCourseIdToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :course_id, :integer
  end
end
