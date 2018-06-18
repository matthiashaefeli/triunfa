# add teacher to statistic
class AddTeachersAndNoStudentsToStatistic < ActiveRecord::Migration[5.1]
  def change
    add_column :statistics, :teachers, :integer
    add_column :statistics, :nostudents, :integer
    add_column :statistics, :igroups, :integer
  end
end
