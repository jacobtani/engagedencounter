class Attendee < ApplicationRecord
  validates :first_name, :surname, :address, :email, :fiance_full_name, :age, :phone_number, :religion, :wedding_date, :preferred_event, :post_wedding_address, presence: true
  enum religion_type: [:ANGLICAN, :BUDDHIST, :CATHOLIC, :HINDU, :MUSLIM, :NO_RELIGION, :PRESBYTERIAN]

  def full_name
    "#{first_name} #{surname}"
  end
end
