# add column online to teacher table
class AddColumnOnlineToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :online, :boolean, default: false
  end
end
