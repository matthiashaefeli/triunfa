class AddAvatarColumnsToMessages < ActiveRecord::Migration[5.1]
  def up
    add_attachment :messages, :avatar
  end

  def down
    remove_attachment :messages, :avatar
  end

end
