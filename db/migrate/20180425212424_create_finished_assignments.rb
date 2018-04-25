class CreateFinishedAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :finished_assignments do |t|

      t.integer :user_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
