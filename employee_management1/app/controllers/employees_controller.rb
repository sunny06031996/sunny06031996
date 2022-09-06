class EmployeesController < ApplicationController
  #before_action :authenticate_employee!
  before_action :set_employee, only: %i[show,edit,update,destroy]

  def index
    @employees=Employee.all
  end

  def new
    @employee=Employee.new
  end 

  def show
  end  

  def create
    @employee=Employee.new(emp_params)
    if @employee.save
      redirect_to employees_path,notice: 'employee created successfully'
      #render json:@employee
    else
      render :new 
    end 
  end 

  def update
    if @employee.update(emp_params)
      redirect_to employees_path(@employee),notice:'employee updated successfully !'
    else
      render :edit
    end 
  end


  def destroy
    @employee.destroy
    redirect_to employees_path,notice:'employee deleted successfully !'
  end   


  end  


  private

  def  emp_params
    params.require(:student).permit(:first_name,:last_name,:address,:contact_number,:role,:email,:password)
  end 


  def set_employee
      @employee=Employee.find(params[:id])
    end 






