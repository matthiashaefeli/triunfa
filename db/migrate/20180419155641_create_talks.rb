# create talks
class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
