class AddDocumentColumToMessage < ActiveRecord::Migration[5.1]
  def up
    add_attachment :messages, :document
  end
  def down
      remove_attachment :messages, :document
  end
end
