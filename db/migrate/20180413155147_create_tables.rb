# create tables
class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
