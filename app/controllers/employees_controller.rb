class EmployeeController < ApplicationController
	def create
		@employee=Employee.new(emp_params)
		if @employee.save
			token = encode_token({ employee_id: @employee.id })
			render json: { employee: @employee, token: token }, status: :ok
		else
			render json:{error:"Please"}	
		end	 

	end	

	private

	def emp_params
		params.permit(:first_name,:last_name,:email,:password)

	end	

end	
