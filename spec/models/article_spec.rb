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
end
