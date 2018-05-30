# Add columnd link to course table
class AddColumnLinkToCours < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :link, :string
  end
end
