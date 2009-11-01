class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]

    if admin?
      flash[:notice] = 'Successfully logged in'
      redirect_to root_path
    else
      flash[:error] = 'Invalid password'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end
end
