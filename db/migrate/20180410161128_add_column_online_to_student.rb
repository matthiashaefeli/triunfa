class AddColumnOnlineToStudent < ActiveRecord::Migration[5.1]
    def change
      add_column :students, :online, :boolean, default: false
    end
end
