# == Schema Information
#
# Table name: articles
#
#  id          :integer         not null, primary key
#  category_id :integer         not null
#  title       :string(255)     not null
#  content     :text            not null
#  author      :string(20)      not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :dependent => :destroy

  validates_presence_of :title
  validates_length_of :title, :in => 3..255
  validates_presence_of :content
  validates_length_of :content, :minimum => 4
  validates_presence_of :author
  validates_length_of :author, :in => 3..20
end
