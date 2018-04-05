class AddAvatarToColumnsToCourse < ActiveRecord::Migration[5.1]
  def up
    add_attachment :courses, :avatar
  end

  def down
    remove_attachment :courses, :avatar
  end
end
