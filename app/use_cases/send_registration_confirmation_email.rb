class SendRegistrationConfirmationEmail
  include UseCase

  validates :registered_couple, presence: true
  validate :check_registered_couple_is_valid

  def initialize(registered_couple:)
    @registered_couple = registered_couple
  end

  def perform
    return unless valid?

    send_registered_couple_email
    send_organiser_email
  end

  private

  attr_accessor :registered_couple

  def send_organiser_email
    OrganiserMailer.new_registration(registered_couple: registered_couple).deliver_now
  end

  def send_registered_couple_email
    RegisteredCoupleMailer.registration_confirmation(registered_couple: registered_couple).deliver_now
  end

  def check_registered_couple_is_valid
    if registered_couple.present? && registered_couple.valid? == false
      errors.add(:registered_couple, "is invalid")
    end
  end
end
