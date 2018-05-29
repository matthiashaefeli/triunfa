class AddColumnCityToGroup < ActiveRecord::Migration[5.1]
  def change
   add_column :groups, :city, :string 
  end
end
