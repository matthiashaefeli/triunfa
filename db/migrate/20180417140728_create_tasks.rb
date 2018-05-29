# create task table
class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :body
      t.integer :user_id
      t.integer :group_id
      t.date :end
      t.string :link
      t.timestamps
    end
  end
end
