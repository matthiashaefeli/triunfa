# create conversations
class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :user_id
      t.integer :table_id
      t.text :body
      t.timestamps
    end
  end
end
