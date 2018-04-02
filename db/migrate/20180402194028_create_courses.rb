class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|

      t.string :name
      t.date :start
      t.date :end
      t.timestamps
    end
  end
end
