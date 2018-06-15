class AddColumnLinkToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :link, :string
  end
end
