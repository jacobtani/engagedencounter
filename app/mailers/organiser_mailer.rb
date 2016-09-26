class OrganiserMailer < ApplicationMailer
  default :to => "tjterminator.dev@gmail.com"

  def new_registration(attendee:)
    @attendee = attendee
    mail(from: @attendee.email, subject: "New Registration to Engaged Encounter")
  end
end
