class AddColumnAdminToFolder < ActiveRecord::Migration[5.1]
  def change
    add_column :folders, :admin, :boolean, default: false
  end
end
