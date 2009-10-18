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

  attr_accessor :new_category_name
  before_save :create_category_from_name

  validates_presence_of :title
  validates_length_of :title, :in => 3..255
  validates_presence_of :content
  validates_length_of :content, :minimum => 4
  validates_presence_of :author
  validates_length_of :author, :in => 3..20
  validates_associated :category
  validate :must_have_category

  private

  def create_category_from_name
    return if new_category_name.blank?

    create_category(:name => new_category_name)
  end

  def must_have_category
    errors.add_to_base('Must have a category') if new_category_name.blank? && category.blank? && category_id.blank?

    if !new_category_name.blank?
      c = Category.new(:name => new_category_name)
      c.errors.each do |attribute, msg|
        errors.add('Category ' + attribute, msg)
      end unless c.valid?
    end
  end
end
