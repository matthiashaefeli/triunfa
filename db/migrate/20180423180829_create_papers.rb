# create papers
class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.timestamps
    end
  end
end
