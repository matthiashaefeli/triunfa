class AddColumnFileToArticle < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :articles, :document
  end
end
