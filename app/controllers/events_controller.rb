class EventsController < ApplicationController
  before_action :set_event, only: [:update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.order("start_date ASC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    respond_to do |format|
      if @event.save
        flash.now[:success] = "New event has been successfully created"
        format.html { redirect_to events_path }
      else
        flash[:error] = "Unable to save new event"
        format.html { redirect_to events_path }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update_attributes event_params
        flash[:success] = "Event was updated successfully."
        format.html { redirect_to events_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:event_date, :location, :start_date)
  end

  def set_event
    @event = Event.find params[:id]
  end
end
