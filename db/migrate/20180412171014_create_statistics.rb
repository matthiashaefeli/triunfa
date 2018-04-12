class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|

      t.integer :students
      t.integer :groups
      t.integer :courses
    
      t.timestamps
    end
  end
end
