class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.date :start_time
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
