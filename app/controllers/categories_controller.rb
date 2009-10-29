class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :authorize

  # GET edit_category_path(:id => 1)
  def edit
    @category = Category.find(params[:id])
  end

  # PUT category_path(:id => 1)
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Saved successfully!'
      redirect_to root_path
    else
      render :action => 'edit'
    end

  end

  # DELETE category_path(:id => 1)
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Article destroyed!'
    else
      flash[:error] = 'There was an error while trying to delete the category!'
    end

    redirect_to root_path
  end

  private

  def record_not_found
    flash[:error] = 'Record not found!'
    redirect_to categories_path
  end
end
