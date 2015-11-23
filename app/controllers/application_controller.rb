class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $DAYS=['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche']
	$HOURS=(9..23).to_a
	$BAC_TYPE = ["L","ES", "S", "SMTG", "Pro", "Autres"] 
	$BAC_MENTIONS = ["Passable","AB", "B", "TB"]
	$STUDY_LEVEL = ["Bac","Bac+1", "Bac+2", "Bac+3", "Bac+4", "Bac+5"]
  $STUDY_DOMAINS = ['Commerce', 'Ingenieur']
	$STUDY_FILIERES = [
					'Arts/Culture/Audiovisuel', 
					'BTS Indistruel', 
					'BTS Tertiaire', 
					'Classe Préparatoire', 
					'Ecoles de commerce', 
					"Ecoles d'ingénieur", 
					'Graphisme/Webdesign', 
					'IEP', 
					'Licence Droit', 
					'Médecine', 
					'Paramédical et Social', 
					'Universités', 
					'Autres', 
					'Je ne sais pas du tout' 
	]

  #before_filter :set_locale
	
	before_filter :configure_permitted_parameters,  if: :devise_controller?
	
  protected

	def configure_permitted_parameters
		# Parametres pour study
		devise_parameter_sanitizer.for(:sign_up) << :first_name
		devise_parameter_sanitizer.for(:sign_up) << :last_name
		devise_parameter_sanitizer.for(:sign_up) << :birthdate
		devise_parameter_sanitizer.for(:sign_up) << :address
		devise_parameter_sanitizer.for(:sign_up) << :telephone
		devise_parameter_sanitizer.for(:sign_up) << :jobs_description
		devise_parameter_sanitizer.for(:sign_up) << :general_description
		devise_parameter_sanitizer.for(:sign_up) << :school_description
		devise_parameter_sanitizer.for(:sign_up) << :availibility_description
		devise_parameter_sanitizer.for(:sign_up) << :availibility
		devise_parameter_sanitizer.for(:sign_up) << :lundi
		devise_parameter_sanitizer.for(:sign_up) << :mardi
		devise_parameter_sanitizer.for(:sign_up) << :mercredi
		devise_parameter_sanitizer.for(:sign_up) << :jeudi
		devise_parameter_sanitizer.for(:sign_up) << :vendredi
		devise_parameter_sanitizer.for(:sign_up) << :samedi
		devise_parameter_sanitizer.for(:sign_up) << :dimanche

	
	end
  
  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    
    if counselor_signed_in?
      profile_counselor_path(current_counselor)
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

	def after_sign_in_path_for(resource)
	  root_path
	end
  
  private
  
  
end
