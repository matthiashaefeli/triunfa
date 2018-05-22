class AddColumnActivToCours < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :activ, :boolean, default: true
  end
end
