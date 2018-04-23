class AddColumnFolderIdToPaper < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :folder_id, :integer
  end
end
