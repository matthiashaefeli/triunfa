# add column super to admins with default false
class AddColumnSuperToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :super, :boolean, default: false
  end
end
