# Add loggin to user
class AddColumnLogginCountsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login_counts, :integer, default: 0
  end
end
