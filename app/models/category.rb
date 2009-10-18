# == Schema Information
#
# Table name: categories
#
#  id   :integer         not null, primary key
#  name :string(14)      not null
#

class Category < ActiveRecord::Base
  has_many :articles, :dependent => :destroy

  validates_presence_of :name
  validates_length_of :name, :in => 3..14
end
