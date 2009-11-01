require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe CommentsController do
  integrate_views

  before(:all) do
    Comment.delete_all
    Article.delete_all
    @comment = create_comment
    @article = create_article
  end

  before(:each) do
    log_in_as_admin
  end

  it 'should create a new comment' do
    lambda {
      post :create, :comment => new_comment.attributes.merge('article_id' => @article.id)
    }.should change(Comment, :count)
    comment = Comment.last
    comment.article.should == @article
    flash[:notice].should_not be_blank
    response.should redirect_to(article_path(@article))
  end

  it 'should not create a new comment' do
    lambda {
      post :create, :name => ''
    }.should_not change(Comment, :count)
    comment = Comment.last
    comment.article.should_not == @article
    assigns(:comment).should be_new_record
    response.should redirect_to(root_path)
  end

  it 'should delete the comment' do
    lambda {
      delete :destroy, :id => @comment.id
    }.should change(Comment, :count).by(-1)
    flash[:notice].should_not be_blank
    response.should redirect_to(article_path(@comment.article))
  end

  it 'should rescue if the record is not found' do
    post :destroy, :id => 'no such id'
    flash[:error].should_not be_blank
    response.should redirect_to(root_path)
  end
end
