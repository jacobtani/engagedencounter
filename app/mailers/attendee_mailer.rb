class AttendeeMailer < ApplicationMailer
  default :from => "tjterminator.dev@gmail.com"

  def registration_confirmation(attendee)
    @attendee = attendee
    mail(from: "tjterminator.dev@gmail.com" , to: @attendee.email, subject: "Confirming Registration to Engaged Encounter")
  end
end
