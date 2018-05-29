# Create Assignment table
class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :points
      t.integer :course_id
      t.timestamps
    end
  end
end
