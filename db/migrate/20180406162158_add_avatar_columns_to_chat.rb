# add avatar to chat
class AddAvatarColumnsToChat < ActiveRecord::Migration[5.1]
  def up
    add_attachment :chats, :avatar
  end

  def down
    remove_attachment :chats, :avatar
  end
end
