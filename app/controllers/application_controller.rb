class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
  
  def access_denied(exception)
  	flash[:danger] = exception.message
  	redirect_to root_url 
	end

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address, :picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address, :picture])
  end

end
