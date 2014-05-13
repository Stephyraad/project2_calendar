class EventsController < ApplicationController

   before_action :authenticate_user

  def index
  	@events= Event.all
  end

  def new
  	@event= Event.new
  end

  def create
    Event.create(params.require(:event).permit(:date, :input, :location, :event_type))
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
   
  end

  def view
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params.require(:event).permit(:date, :input, :location, :event_type))
      redirect_to events_path
    else
      render 'edit'
    end
  end
 
 def destroy
    @event= Event.find(params[:id])
    #remove the events that would otherwise still exist in the database
    Event.where(event_id: @event.id).destroy_all
    #remove/take out from the burrito from the view
    @event.destroy
    redirect_to events_path
  end

end
