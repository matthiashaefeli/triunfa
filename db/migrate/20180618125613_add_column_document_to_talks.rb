# Add document to talks
class AddColumnDocumentToTalks < ActiveRecord::Migration[5.1]
  def up
    add_attachment :talks, :document
  end

  def down
    remove_attachment :talks, :document
  end
end
