class Api::V1::EmployeesController < Api::V1::ApplicationController

  def create
    @employee=Employee.new(emp_params)
    if @employee.save
      token = encode_token({ employee_id: @employee.id })
      render json: { employee: @employee, token: token }, status: :ok
    else
      render json:{error:"Please"}  
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

    

  private

  def emp_params
    params.permit(:first_name,:last_name,:address,:contact_number,:role,:email,:password,:teamlead_id)

  end 


  def index
    @employees=Employee.all
    render json: @employees
   
  end

  

  def show
    @employee=Employee.find(params[:id])
  end 

   

  # def create
  #   @employee=Employee.new(emp_params)
  #   if @employee.save
  #     token = encode_token({ employee_id: @employee.id })
  #     render json: { employee: @employee, token: token }, status: :ok
  #   else
  #     render :new 
  #   end 
  # end 

  # # # def create
  # # #   @employee=Employee.new(emp_params)
  # # #   respond_to do |format|
  # # #     if @employee.save
  # # #       # format.html { redirect_to(@employee, :notice => 'employee  was created  successfully created.') }
  # # #       # format.xml  { render :xml => @employee, :status => :created, :location => @post }
  # # #       format.json {render json:{message:'employee created successfully !'},status:200}
  # # #     else
  # # #       format.html { render :action => "new" }
  # # #     end
  # # #   end  
  # # # end POST




  def update
    byebug
    @employee = Employee.find(params[:id])
    respond_to do |format|
       if @employee
        @employee.update(emp_params)
        format.json {render json: {message:'employee updated successfully !'},status:200
       }
         else
          format.html { render :action => "edit" }
        end
    end   
  end


  def destroy
  	@employee = Employee.find(params[:id])
  	respond_to do |format|
  		if @employee
  			@employee.destroy
  			format.json {render json: {message:'employee deleted successfully !'},status:200}
  		else
         	format.json {render json:{message:"Unable to deleted "},status:400}
      	end
  	end		
  end 


  def show_employe
    @under_teamlead=Employee.where(teamlead_id:params[:teamlead_id])
    render json: @under_teamlead
  end  


    


  # private

  # def  emp_params
  #   params.require(:employee).permit(:first_name,:last_name,:address,:contact_number,:role,:email,:password_digest)
  #     #params.require(:employee).permit(:first_name,:role,:email,:password)
  # end 


  


  # def login
  #   @employee =  Employee.find_by(email: emp_params[:email])   
  #   if @employee && @employee.authenticate(emp_params[:password_digest])
  #     token = encode_token({ employee_id: @employee.id })
  #     render json: { employee: @user, token: token }, status: :ok
  #   else
  #     render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
  #   end
  # end 

  


  def set_employee
    @employee=Employee.find(params[:id])
  end 


  def set_team_employee
    @employee=Employee.find(params[:id])
  end 

  
end	