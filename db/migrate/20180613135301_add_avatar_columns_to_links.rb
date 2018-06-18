# Add avatar to links
class AddAvatarColumnsToLinks < ActiveRecord::Migration[5.1]
  def up
    add_attachment :links, :avatar
  end

  def down
    remove_attachment :links, :avatar
  end
end
