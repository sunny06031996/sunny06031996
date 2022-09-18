class Api::V1::AuthenticationController < Api::V1::ApplicationController
   
  def login
    byebug
    @employee =  Employee.find_by(email: params[:email])   
    if @employee && @employee.authenticate(params[:password_digest])
      token = encode_token({ employee_id: @employee.id })
      render json: { employee: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end 

  private

  def  params
    params.require(:employee).permit(:email,:password)
      #params.require(:employee).permit(:first_name,:role,:email,:password)
  end 

end
