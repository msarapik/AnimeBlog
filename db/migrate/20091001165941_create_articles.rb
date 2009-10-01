class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id, :null => false
      t.string  :title,       :null => false
      t.text    :content,     :null => false
      t.string  :author,      :null => false, :limit => 20
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
