# Add avatar to flyer
class AddAvatarColumnsToFlyer < ActiveRecord::Migration[5.1]
  def up
    add_attachment :flyers, :avatar
  end

  def down
    remove_attachment :flyers, :avatar
  end
end
