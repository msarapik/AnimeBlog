# == Schema Information
#
# Table name: categories
#
#  id   :integer         not null, primary key
#  name :string(20)      not null
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Category do
  before do
    @category = new_category
  end

  describe 'name' do
    it 'should not be valid if the name exceeds 20 characters' do
      @category.name = 'a' * 30
      @category.should_not be_valid
    end

    it 'should not be valid if the name is empty' do
      @category.name = ''
      @category.should_not be_valid
    end
  end
end
