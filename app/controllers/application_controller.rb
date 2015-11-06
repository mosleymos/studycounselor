class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :set_locale
	
	before_filter :configure_permitted_parameters,  if: :devise_controller?
	
  protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :first_name
		devise_parameter_sanitizer.for(:sign_up) << :last_name

	end
  
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    
    if counselor_signed_in?
      profile_counselor_path(current_counselor)
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
  
  private
  
  
end
