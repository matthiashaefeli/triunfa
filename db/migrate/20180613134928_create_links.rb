# create links
class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :name
      t.string :link
      t.timestamps
    end
  end
end
