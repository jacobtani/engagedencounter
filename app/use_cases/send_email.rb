class SendEmail
  include UseCase

  validates :attendee, presence: true
  validate :check_attendee_is_valid

  def initialize(attendee:)
    @attendee = attendee
  end

  def perform
    send_email_to_attendee
    send_email_to_organiser
  end

  private

  attr_accessor :attendee

  def send_email_to_attendee
    begin
      AttendeeMailer.registration_confirmation(attendee).deliver_now
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      errors.add(:attendee, e)
    end
  end

  def send_email_to_organiser
    begin
      OrganiserMailer.new_registration(attendee).deliver_now
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
      errors.add(:attendee, e)
    end
  end

  def check_attendee_is_valid
    binding.pry
    if attendee.present? && attendee.valid? == false
      errors.add(:attendee, "Attendee is invalid")
    end
  end
end
