class CreateGroseries < ActiveRecord::Migration[5.1]
  def change
    create_table :groseries do |t|
      t.string :name
      t.boolean :done, default: true
      t.timestamps
    end
  end
end
