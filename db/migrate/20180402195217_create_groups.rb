# create groups
class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :activ, default: true
      t.string :key
      t.timestamps
    end
  end
end
