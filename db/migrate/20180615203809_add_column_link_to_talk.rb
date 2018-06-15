class AddColumnLinkToTalk < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :link, :string
  end
end
