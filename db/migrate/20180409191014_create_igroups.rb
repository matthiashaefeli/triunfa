class CreateIgroups < ActiveRecord::Migration[5.1]
  def change
    create_table :igroups do |t|

      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
