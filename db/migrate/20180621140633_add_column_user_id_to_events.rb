class AddColumnUserIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :user_id, :integer
  end
end
