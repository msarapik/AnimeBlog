class CommentsController < ApplicationController

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
    if @comment.destroy
      flash[:notice] = 'Comment destroyed!'
    else
      flash[:error] = 'There was an error while trying to delete the comment!'
    end

    redirect_to @comment.article
  end
end
