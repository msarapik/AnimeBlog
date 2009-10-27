class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :authorize, :except => [:index, :by_category, :show]

  # GET articles_path
  def index
    @articles = Article.all
  end

  # GET article_path(:id => 1)
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  # GET new_article_path
  def new
    @article = Article.new
  end

  # POST article_path
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = 'New article saved!'
      redirect_to articles_path
    else
      render :action => 'new'
    end
  end

  # GET edit_article_path(:id => 1)
  def edit
    @article = Article.find(params[:id])
  end

  # PUT article_path(:id => 1)
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = 'Saved successfully!'
      redirect_to articles_path
    else
      render :action => 'edit'
    end
  end

  # DELETE article_path(:id => 1)
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = 'Article destroyed!'
    else
      flash[:error] = 'There was an error while trying to delete the article!'
    end

    redirect_to articles_path
  end

  def by_category
    @articles = Article.find(:all, 
                 :joins => 'LEFT JOIN categories ON categories.id = articles.category_id', 
                 :select => 'articles.*', 
                 :conditions => ['categories.name = ?', params[:category_name]])
    render :action => 'index'
  end

  private

  def record_not_found
    flash[:error] = 'Record not found!'
    redirect_to articles_path
  end
end
