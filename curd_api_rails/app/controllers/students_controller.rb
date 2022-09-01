class StudentsController < ApplicationController
	def index
	@students=Student.all 
	#puts "student details #{@students}"
	logger.debug "student details : #{@students}"
	render :json => @students
	end	

	# def new
	# @students=Student.new  
	# end	

	def create
		@student=Student.new(student_params)
		if @student.save
			render json:@student
			logger.debug "student details : #{@student}"
		else
			render error:{error: 'Unable create user '}
		end	
	end	


	def update
		@student = Student.find(params[:id])
		if @student
			@student.update(student_params)
			render json: {message: 'student  successfully updated '}
		else
			render error: {error:'unable to update '}
		end	
	end

	def destroy
		@student = Student.find(params[:id])
		if @student
			@student.destroy
			render json: {message: 'student deleted '}
			logger.debug "student deleted details :#{@student}"
		else 
			render error: {message: 'unable to delete'}
		end	
	end	
			





    private
	def student_params
		params.require(:student).permit(:first_name,:last_name,:email,:address,:contact_number)
	end	
 end	