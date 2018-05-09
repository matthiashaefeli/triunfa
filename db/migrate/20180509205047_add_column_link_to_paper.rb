class AddColumnLinkToPaper < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :link, :string
  end
end
