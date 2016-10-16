class SendRegistrationConfirmationEmail
  include UseCase

  validates :attendee, presence: true
  validate :check_attendee_is_valid

  def initialize(attendee:)
    @attendee = attendee
  end

  def perform
    return unless valid?

    send_attendee_email
    send_organiser_email
  end

  private

  attr_accessor :attendee

  def send_organiser_email
    OrganiserMailer.new_registration(attendee: attendee).deliver_now
  end

  def send_attendee_email
    AttendeeMailer.registration_confirmation(attendee: attendee).deliver_now
  end

  def check_attendee_is_valid
    if attendee.present? && attendee.valid? == false
      errors.add(:attendee, "is invalid")
    end
  end
end
