class EventsController < ApplicationController 
  # before_action :check_role

  def new
 
  end

  def create
    puts "Inside the Events controller"
    @event=Event.new(event_params)
    if @event.save
      byebug
      render json:@event
      logger.debug "event details : #{@event}"
    else
      render error:{error: 'Unable create event'}
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
