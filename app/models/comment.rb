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
end
