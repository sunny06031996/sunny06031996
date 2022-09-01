class ApplicationController < ActionController::Base
	before_action :authenticate_employee!
	protect_from_forgery with: :exception
    before_action :update_allowed_parameters, if: :devise_controller?

    protected
    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |e| e.permit(:first_name, :last_name, :address,:contact_number,:role,:email,
          :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |e| e.permit(:first_name, :last_name,:address,:contact_number,:role,:email,
         :password, :password_confirmation)}
    end
end
