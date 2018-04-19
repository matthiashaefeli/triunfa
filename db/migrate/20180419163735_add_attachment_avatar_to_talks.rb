class AddAttachmentAvatarToTalks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :talks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :talks, :avatar
  end
end
