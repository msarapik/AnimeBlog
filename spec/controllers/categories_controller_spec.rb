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

  it 'should update the category' do
    put :update, :id => @category.id, :category => {:name => 'some name'}
    @category.reload
    @category.name.should == 'some name'
    flash[:notice].should_not be_blank
    response.should redirect_to(root_path)
  end

  it 'should not update the category' do
    put :update, :id => @category.id, :category => {:name => ''}
    @category.reload
    @category.name.should_not == ''
    flash[:notice].should be_blank
    response.should render_template(:edit)
  end

  it 'should delete the category' do
    lambda {
      delete :destroy, :id => @category.id
    }.should change(Category, :count).by(-1)
    flash[:notice].should_not be_blank
    response.should redirect_to(root_path)
  end
end
