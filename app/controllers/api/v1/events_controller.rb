class Api::V1::EventsController < Api::V1:: ApplicationController

    def index
        @events = Event.all
        render json: @events,each_serailizer:PostSerializer
    end    

    def create
        employee=current_employee
        @event=employee.events.new(event_params)
        if @event.save
             render json: { event: @event }, status: :ok
        else 
             render json:{error:"Something went wrong"} 
        end 
    end 

    def  current_employee
        @current_employee = Employee.find_by(params[:id])  
    end    

    private
    def event_params
        params.require(:event).permit(:name,:current_employee)
    end 
end    
