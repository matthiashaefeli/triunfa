# Add link to publication
class AddColumnLinkToPublication < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :link, :string
  end
end
