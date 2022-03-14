class RegisteredCouplesController < ApplicationController
  before_action :set_registered_couple, only: [:update, :edit, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index]

  def index
    @registered_couples = RegisteredCouple.order(:id)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = RegisteredCouplesPdf.new(registered_couples: @registered_couples)
        send_data pdf.render, filename: "registered_couples_#{Date.current}.pdf", type: 'application/pdf'
      end
    end
  end

  def new
    @registered_couple = RegisteredCouple.new
  end

  def create
    @registered_couple = RegisteredCouple.new registered_couple_params
    @registered_couple.event = Event.find(params[:registered_couple][:preferred_event])
    respond_to do |format|
      if @registered_couple.save
        SendRegistrationConfirmationEmail.perform!(registered_couple: @registered_couple)
        flash.now[:success] = "Thank you for registering for an Engaged Encounter Weekend #{@registered_couple.first_name}."
        format.html { redirect_to root_path }
      else
        flash[:error] = "Unable to save new registered couple for Engaged Encounter Weekend"
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @registered_couple.update_attributes registered_couple_params
        flash[:success] = "Registered Couple was updated successfully."
        format.html { redirect_to registered_couples_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @registered_couple.destroy
    redirect_to registered_couples_path
  end

  private

  def registered_couple_params
    params.require(:registered_couple).permit(:first_name, :surname, :preferred_name, :age, :email, :phone_number, :address, :religion, :parish, :fiance_first_name, :fiance_surname, :fiance_preferred_name, :fiance_age, :fiance_email, :fiance_phone_number, :fiance_address, :fiance_religion, :fiance_parish, :wedding_date, :preferred_event, :post_wedding_address, :dietary_requirements, :event_id)
  end

  def set_registered_couple
    @registered_couple = RegisteredCouple.find params[:id]
  end
end
