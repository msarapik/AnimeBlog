# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  article_id :integer         not null
#  author     :string(20)      not null
#  content    :text            not null
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :article 

  validates_presence_of :author
  validates_length_of :author, :in => 3..20
  validates_presence_of :content
  validates_length_of :content, :in => 3..500
  validates_associated :article
end
