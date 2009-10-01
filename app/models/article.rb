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
  has_many :comments
end
