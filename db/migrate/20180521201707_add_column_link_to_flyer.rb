# Add link to flyer
class AddColumnLinkToFlyer < ActiveRecord::Migration[5.1]
  def change
    add_column :flyers, :link, :string
  end
end
