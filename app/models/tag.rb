class Tag < ActiveRecord::Base
  has_many :articles, :through => :taggings
  has_many :taggings, :dependent => :destroy

  named_scope :all_with_articles_size, 
              :select => 'tags.*, COUNT(taggings.article_id) AS size', 
              :joins => :taggings, 
              :group => 'taggings.tag_id'
end
