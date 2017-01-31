class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:update, :edit, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index]

  def index
    @attendees = Attendee.order(:id)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = AttendeesPdf.new(attendees: @attendees)
        send_data pdf.render, filename: "attendees_#{Date.current}.pdf", type: 'application/pdf'
      end
    end
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new attendee_params
    respond_to do |format|
      if @attendee.save
        SendRegistrationConfirmationEmail.perform!(attendee: @attendee)
        flash.now[:success] = "Thank you for registering for an Engaged Encounter Weekend #{@attendee.first_name}. Please register for your fiance if you have not already done so."
        format.html { render :new }
      else
        flash[:error] = "Unable to save new attendee for Engaged Encounter Weekend"
        format.html { render :new }
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
    params.require(:attendee).permit(:first_name, :surname, :age, :email, :fiance_full_name, :phone_number, :address, :religion, :parish, :wedding_date, :preferred_event, :post_wedding_address, :dietary_requirements)
  end

  def set_attendee
    @attendee = Attendee.find params[:id]
  end
end
