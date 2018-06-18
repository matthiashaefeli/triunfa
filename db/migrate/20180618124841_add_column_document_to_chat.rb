# Add document to chat
class AddColumnDocumentToChat < ActiveRecord::Migration[5.1]
  def up
    add_attachment :chats, :document
  end

  def down
    remove_attachment :chats, :document
  end
end
