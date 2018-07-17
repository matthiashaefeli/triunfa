class AddColumnSpaceIdToPublication < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :space_id, :integer
  end
end
