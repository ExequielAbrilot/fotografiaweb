class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   rescue_from CanCan::AccessDenied do |exception|
  sign_out :user if user_signed_in?
  redirect_to new_user_session_path, alert: exception.message
  end

   before_action do  
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end 

   before_action :configure_permitted_parameters, if: :devise_controller?
   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:email,:password, :password_confirmation,:primer_nombre,:segundo_nombre,:apellido,:is_female,:datos_nacimiento, roles: []) }
     #devise_parameter_sanitizer.for(:account_update)  { |u| u.permit(:email,:password, :password_confirmation,:primer_nombre,:segundo_nombre,:apellido,:is_female,:datos_nacimiento, roles: []) }
       devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email,   :password, :password_confirmation, :current_password, :primer_nombre,:segundo_nombre,:apellido,:is_female,:datos_nacimiento, roles: []) }
   end
   


  protect_from_forgery with: :exception
  def show

  end
end
