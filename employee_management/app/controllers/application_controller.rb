class ApplicationController < ActionController::Base
	before_action :authenticate_employee!
	protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?


  def HR?
      current_employee.role = User.where(role: [:HR])
  end

  def TL?
    current_employee.role = User.where(role: [:TL])
  end

  def Manager?
    current_employee.role = User.where(role: [:Manager])
  end

  protected
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |e| e.permit(:first_name, :last_name, :address,:contact_number,:role,:email,:image, 
     :password, :password_confirmation)}
  end


end
