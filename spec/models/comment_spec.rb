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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before do
    @comment = new_comment
  end

  it 'should be valid' do
    @comment.should be_valid
  end

  describe 'author' do
    it 'should not be valid if the author is more than 20 characters long' do
      @comment.author = 'a' * 30
      @comment.should_not be_valid
    end

    it 'should not be valid if the author is less than 3 characters long' do
      @comment.author = 'ab'
      @comment.should_not be_valid
    end
  end

  describe 'content' do
    it 'should not be valid if the content is less than 3 characters long' do
      @comment.content = 'ab'
      @comment.should_not be_valid
    end

    it 'should not be valid if the content is more than 500 characters long' do
      @comment.content = 'a' * 510
      @comment.should_not be_valid
    end
  end
end
