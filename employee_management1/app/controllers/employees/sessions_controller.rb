# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  

  def check_role
    Employee.find_by(role:"HR")
    
  end  

  # GET /resource/sign_in
  def new
    byebug
    if @employee.roles
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  #DELETE /resource/sign_out
    def destroy
      byebug
      super
    end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end