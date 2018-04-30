class AddColumnLinkToCours < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :link, :string
  end
end
