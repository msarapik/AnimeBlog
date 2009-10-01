class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :article_id, :null => false
      t.string  :author,     :null => false, :limit => 20
      t.text    :content,    :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
