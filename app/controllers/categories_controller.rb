class CategoriesController < ApplicationController
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
    @category.destroy
    flash[:notice] = 'Article destroyed!'
    redirect_to root_path
  end
end
