require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/index" do
  before(:each) do
    render 'articles/index'
  end
end
