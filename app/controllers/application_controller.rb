class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :configure_permitted_parameters, if: :devise_controller?
  #before_action :configure_permitted_parameters


#	protected
#		def configure_permitted_parameters
#           devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
#            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
#        end
#	protected
#	def configure_permitted_parameters
#		if(self.class <= Devise::RegistrationsController)
#			self.class.send(:define_method, :resource_params) do 
#				params.require(resource_name).permit(:email,:password,:password_confirmation,:name)
#		end
#	end
end
