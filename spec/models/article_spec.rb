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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  before(:each) do
    @article = new_article
  end
  
  it 'should be valid' do
    @article.should be_valid
  end

  describe 'title' do
    it 'should not be valid if it is empty' do
      @article.title = ''
      @article.should_not be_valid
    end

    it 'should not be valid if it exceeds 255 characters' do
      @article.title = 'a' * 300
      @article.should_not be_valid
    end
  end

  describe 'content' do
    it 'should not be valid if it is less than 4 characters' do
      @article.content = 'ab'
      @article.should_not be_valid
    end
  end

  describe 'author' do
    it 'should not be valid if it is less than 3 characters' do
      @article.author = 'ab'
      @article.should_not be_valid
    end

    it 'should not be valid if it exceeds 20 characters' do
      @article.author = 'a' * 30
      @article.should_not be_valid
    end
  end

  describe 'association' do
    it 'should not be valid if the category is invalid' do
      @article.category = Category.new
      @article.should_not be_valid
    end
  end

  describe 'must have category' do
    it 'should not be valid if the article has no category' do
      @article.category = nil
      @article.should_not be_valid
    end

    it 'should not be valid if the new_category_name is not blank and not valid' do
      @article.new_category_name = 'a'
      @article.should_not be_valid
    end
  end
end

describe Article do
  before(:each) do
    @article = new_article
  end

  describe 'create category from name' do
    it 'it should create a new category' do
      @article.new_category_name = 'new name'
      lambda { 
      @article.send(:create_category_from_name)
      }.should change(Category, :count).by(1)
    end

    it 'should return if the category name field is blank' do
      @article.new_category_name = ''
      lambda {
        @article.send(:create_category_from_name)
      }.should_not change(Category, :count)
    end
  end
end
