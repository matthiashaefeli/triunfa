class AddColumnOnlineToTeacher < ActiveRecord::Migration[5.1]
    def change
      add_column :teachers, :online, :boolean, default: false
    end
end
