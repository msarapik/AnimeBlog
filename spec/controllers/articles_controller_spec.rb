require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do
  integrate_views

  before(:all) do
    Article.delete_all
    @article = create_article
    @category = create_category
  end

  it 'should show all articles' do
    get :index
    assigns(:articles).size.should > 0
    response.should be_success
  end

  it 'should show a new article form' do
    get :new
    assigns(:article).should be_new_record
    response.should be_success
  end

  it 'should create a new article' do
    lambda {
      post :create, :article => new_article.attributes.merge('category_id' => @category.id)
    }.should change(Article, :count)
    article = Article.last
    article.category.should == @category
    flash[:notice].should_not be_blank
    response.should redirect_to(articles_path)
  end

  it 'should not create a new article' do
    lambda {
      post :create, :article => new_article.attributes.merge('category_id' => nil)
    }.should_not change(Article, :count)
    article = Article.last
    article.category.should_not == @category
    assigns(:article).should be_new_record
    response.should render_template(:new)
  end

  it 'should show an edit form' do
    get :edit, :id => @article.id
    @article.should == assigns(:article)
    response.should be_success
  end

  it 'should update an article' do
    put :update, :id => @article.id, :article => {:title => 'blabla'}
    @article.reload
    @article.title.should == 'blabla'
    flash[:notice].should_not be_blank
    response.should redirect_to(articles_path)
  end

  it 'should not update an article' do
    put :update, :id => @article.id, :article => {:title => ''}
    @article.reload
    @article.title.should_not == ''
    flash[:notice].should be_blank
    response.should render_template(:edit)
  end

  it 'should destroy an article' do
    lambda {
      delete :destroy, :id => @article.id
    }.should change(Article, :count).by(-1)
    flash[:notice].should_not be_blank
    response.should redirect_to(articles_path)
  end

  it 'should not destroy an article' do
    lambda {
      delete :destroy, :id => 'no such id'
    }.should_not change(Article, :count)
    flash[:error].should_not be_blank
    response.should redirect_to(articles_path)
  end

end
