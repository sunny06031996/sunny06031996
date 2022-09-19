class Api::V1::EmployeesController < Api::V1::ApplicationController
   before_action :set_employee, only: [:show, :destroy, :update]
   
   def index
    @employees=Employee.all
    render json: @employees,each_serailizer: EmployeeSerializer
   end


  def create
    @employee=Employee.new(emp_params)
    if @employee.save
      token = encode_token({ employee_id: @employee.id })
      render json: { employee: @employee, token: token }, status: :ok
    else
      render json:{error:"Please fill valid field"}  
    end  
  end 

  def update
    @employee = Employee.find(params[:id])
    if @employee
      @employee.update(emp_params)
      render json: {message:'employee updated successfully !'},status:200
    else
      render json:{error:'employee not updated'}
    end  
  end

  def login
    @employee =  Employee.find_by(email: emp_params[:email])   
    if @employee && @employee.authenticate(emp_params[:password])
      token = encode_token({ employee_id: @employee.id })
      render json: { employee: @employee, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

    
  def show
    @employee=Employee.find(params[:id])
  end 


  def destroy
  	@employee = Employee.find(params[:id])
    if(@employee.isdeleted==true)
      render json: {message:'employee is already deleted'},status:400 
  	else
  		@employee.update(isdeleted:true)
      @employee.save
  		render json: {message:'employee deleted successfully !'},status:200
    end			
  end 

  def show_employee
    @under_teamlead=Employee.where(teamlead_id:params[:teamlead_id])
    render json: @under_teamlead
  end  

  # private

  # def  emp_params
  #   params.require(:employee).permit(:first_name,:last_name,:address,:contact_number,:role,:email,:password_digest)
  #     #params.require(:employee).permit(:first_name,:role,:email,:password)
  # end
  

  def set_employee
    @employee=Employee.find(params[:id])
  end 


  def set_team_employee
    @employee=Employee.find(params[:id])
  end

  private
  def emp_params
    params.permit(:first_name,:last_name,:address,:contact_number,:role,:email,:password,:teamlead_id)

  end  

  
end	