require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SessionsController do
  it 'should create a new session' do
    controller.stub!(:admin?).and_return(true)
    get :create
    flash[:notice].should_not be_blank
    response.should redirect_to(root_path)
  end

  it 'should not create a new session' do
    controller.stub!(:admin?).and_return(false)
    get :create
    flash[:error].should_not be_blank
    response.should redirect_to(new_session_path)
  end

  it 'should end a session' do
    get :destroy
    flash[:notice].should_not be_blank
    response.should redirect_to(root_path)
  end
end
