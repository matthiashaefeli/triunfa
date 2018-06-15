class AddColumnLinkToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :link, :string
  end
end
