require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  describe '#admin?' do
    it 'should return true' do
      YAML.stub!(:load_file).and_return(:pw => 'test')
      session[:password] = 'test'
      controller.send(:admin?).should be_true
    end

    it 'should return false' do
      YAML.stub!(:laod_file).and_return(:pw => 'test')
      session[:password] = 'false password'
      controller.send(:admin?).should be_false
    end
  end
end
