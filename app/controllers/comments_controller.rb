class CommentsController < ApplicationController
  before_filter :authorize, :except => :create

  # POST comment_path
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment saved!'
      redirect_to @comment.article
    else
      redirect_to root_path
    end
  end

  # DELETE comment_path(:id => 1)
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment destroyed!'
    redirect_to @comment.article
  end
end
