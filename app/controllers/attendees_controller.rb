class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:update, :edit, :destroy]

  def index
    @attendees = Attendee.all
  end

  def new
    @attendee  = Attendee.new
  end

  def create
    @attendee = Attendee.new attendee_params
    respond_to do |format|
      if @attendee.save
        SendAttendeeEmail.perform!(attendee: @attendee)
        SendOrganiserEmail.perform!(attendee: @attendee)
        flash.now[:success] = "New attendee has been successfully created"
        format.html { redirect_to welcome_path }
      else
        flash[:error] = "Unable to save new attendee"
        format.html { redirect_to attendees_path }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @attendee.update_attributes attendee_params
        flash[:success] = "Attendee was updated successfully."
        format.html { redirect_to attendees_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_path
  end

  private

  def attendee_params
    params.require(:attendee).permit(:first_name, :surname, :age, :email, :fiance_full_name, :phone_number, :address, :religion, :parish, :wedding_date, :preferred_event, :post_wedding_address)
  end

  def set_attendee
    @attendee = Attendee.find params[:id] rescue nil
  end
end
