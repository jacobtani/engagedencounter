class AttendeeMailer < ApplicationMailer
  default :from => "tjterminator.dev@gmail.com"

  def registration_confirmation(attendee:)
    @attendee = attendee
    mail(to: @attendee.email, subject: "Registration Confirmation to Engaged Encounter")
  end
end
