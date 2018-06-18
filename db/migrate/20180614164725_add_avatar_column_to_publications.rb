# Add avatar to publication
class AddAvatarColumnToPublications < ActiveRecord::Migration[5.1]
  def up
    add_attachment :publications, :avatar
  end

  def down
    remove_attachment :publications, :avatar
  end

end