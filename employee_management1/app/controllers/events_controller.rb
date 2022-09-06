class EventsController < ApplicationController 
  # before_action :check_role

  def new
    @event=Event.new
 
  end

  def create
    @event=Event.new(event_params)
    if @event.save
      #render json:@event
      redirect_to employees_path,notice: 'event created successfully'
    else
      render :new
    end 
  end 


  def update
  end

  def delete
  end

  def show
  end

  def all
  end

  def check_role
    
  end 

  private
  def event_params
    params.require(:event).permit(:employee_id,:name,:location)
  end 
end


 