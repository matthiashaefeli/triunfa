# add online to admin
class AddColumnOnlineToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :online, :boolean, default: false
  end
end
