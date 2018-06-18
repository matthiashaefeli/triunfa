# Add avatar to resource
class AddAvatarColumnToResource < ActiveRecord::Migration[5.1]
  def up
    add_attachment :resources, :avatar
  end
  
  def down
    remove_attachment :resources, :avatar
  end
end
