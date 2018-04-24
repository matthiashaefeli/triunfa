class AddAttachmentDocumentToCourses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :courses do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :courses, :document
  end
end
