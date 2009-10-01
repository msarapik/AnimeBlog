# == Schema Information
#
# Table name: categories
#
#  id   :integer         not null, primary key
#  name :string(20)      not null
#

class Category < ActiveRecord::Base
  has_many :articles
end
