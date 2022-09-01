class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :check_role
  def check_role
    if @employee.HR
      
    end  

  end  



  def index
    @employees=Employee.all
  end

  def create
    @employee=Employee.new(emp_params)
    if @employee.save
      render json:@employee
    else
      render error:{error: 'Unable create user '}
    end 
  end   


  private
  def student_params
    params.require(:student).permit(:first_name,:last_name,:address,:contact_number,:email)
  end 



end
