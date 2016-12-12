class SendEnquiryEmail
  include UseCase

  validates :message, presence: true

  def initialize(message:)
    @message = message
  end

  def perform
    send_organiser_email
  end

  private

  attr_reader :message

  def send_organiser_email
    OrganiserMailer.send_enquiry(message: message).deliver_now
  end
end
