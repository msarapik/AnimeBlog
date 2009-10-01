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
end
