class Admin::EventsController < ApplicationController
  layout 'admin'
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_event_path(@event), notice: 'Event was successfully created.' 
  end
  
  def edit
  @event = Event.find(params[:id])
  end
end
