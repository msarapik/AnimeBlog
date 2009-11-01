# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :admin?

  protected

  def authorize
    unless admin?
      flash[:error] = 'unauthorized access'
      redirect_to root_path
      false
    end
  end

  def admin?
    @password_file ||= YAML.load_file("#{RAILS_ROOT}/config/password.yml")
    session[:password] == @password_file[:pw]
  end

  def record_not_found
    flash[:error] = 'Record not found!'
    redirect_to root_path
  end
end
