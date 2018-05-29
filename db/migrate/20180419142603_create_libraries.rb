# Create Library table
class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.timestamps
    end
  end
end
