class AddColumnNameToResource < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :name, :string
  end
end
