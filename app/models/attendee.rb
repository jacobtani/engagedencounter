class Attendee < ApplicationRecord
  validates :first_name, :surname, :address, :email, :fiance_full_name, :age, :phone_number, 
            :religion, :wedding_date, :preferred_event, :post_wedding_address, presence: true
  enum religion: [:ANGLICAN, :BUDDHIST, :CATHOLIC, :HINDU, :NON_RELIGIOUS, :PRESBYTERIAN]
end