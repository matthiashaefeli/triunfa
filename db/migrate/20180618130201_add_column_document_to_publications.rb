class AddColumnDocumentToPublications < ActiveRecord::Migration[5.1]
  def up
    add_attachment :publications, :document
  end
  def down
      remove_attachment :publications, :document
  end
end
