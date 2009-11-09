class Tag < ActiveRecord::Base
  has_many :articles, :through => :taggings
  has_many :taggings, :dependent => :destroy

  def self.tags_with_articles
    query = 'SELECT tags.*, COUNT(taggings.article_id) AS size FROM taggings'
    query << ' JOIN tags ON taggings.tag_id = tags.id GROUP BY tag_id'
    self.find_by_sql(query)
    #self.all(:conditions => {}, :select =>, :joins =>)
  end
end
