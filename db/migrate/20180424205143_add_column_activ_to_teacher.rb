class AddColumnActivToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :activ, :boolean, default: true
  end
end
