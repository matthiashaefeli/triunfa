class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|

      t.integer :group_id
      t.timestamps
    end
  end
end
