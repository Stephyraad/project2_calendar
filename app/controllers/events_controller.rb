class EventsController < ApplicationController

   before_action :authenticate_user

  def index
  	@events= current_user.events.all
  end

  def new
  	@event= current_user.events.new
  end

  def create
    @event= Event.new(params.require(:event).permit(:date, :input, :location, :event_type))
    @event.user = current_user
    @event.save
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
   
  end

  def show
    @event = Event.find(params[:id])
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
