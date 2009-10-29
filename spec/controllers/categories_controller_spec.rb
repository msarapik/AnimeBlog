require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CategoriesController do
  before(:all) do
    Category.delete_all
    @category = create_category
  end

  before(:each) do
    log_in_as_admin
  end

  it 'should show the edit page' do
    get :edit, :id => @category.id
    response.should be_success
  end
end
