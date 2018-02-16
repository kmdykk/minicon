class Admin::EventsController < ApplicationController
  PER = 5
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :event_params, only: [:create, :update]
  
  layout 'admin'
  def index
    @events = Event.page(params[:page]).per(PER)
  end
  
  def show
  
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_event_path(@event), notice: 'Event was successfully created.' 
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
  end
  
  def destroy
    @event.destroy
    redirect_to admin_events_path, notice: 'Event was successfully destroyed'
  end
  
 private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  end
 
end
