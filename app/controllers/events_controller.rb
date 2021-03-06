class EventsController < ApplicationController

   before_action :authenticate_user

  def index
    if params[:show] == "all_users_events"
      @events= Event.all
    elsif params[:future] == "true"
      @events=Event.where(:user_id => current_user.id, :date.gte => Date.today)
  	 #@events= current_user.events.all
    else
    @events=Event.where(:user_id => current_user.id, :date.lt => Date.today)  
    end
  end

  def new
  	@event= current_user.events.new
  end

  def create
    @event= Event.new(params.require(:event).permit(:date, :input, :location, :address1, :city, :state, :zipcode, :event_type, :picture))
    #raise @event.inspect
    @event.user = current_user
    if @event.save
      flash[:success]= "Event successfully created"
      redirect_to events_path
    else
      flash[:error]= "Event not yet create! Try Again!"
      render 'new'
    end
  end

  def edit
   
    @event = Event.find(params[:id])
   
  end

  def show
    @event = Event.find(params[:id])

    #@upcoming_event= Event.where("(?)",date) 
    # @user = @current_user
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params.require(:event).permit(:date, :input, :location, :address1, :city, :state, :zipcode, :event_type, :picture))
      redirect_to event_path
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

  def event_params
    params.require(:event).permit(:name, :picture)
  end



end
