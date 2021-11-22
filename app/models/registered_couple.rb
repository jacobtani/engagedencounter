class RegisteredCouple < ApplicationRecord
  validates :first_name, :surname, :address, :email, :age, :phone_number, :religion, :fiance_first_name, :fiance_surname, :fiance_address, :fiance_email, :age, :fiance_phone_number, :fiance_religion, :preferred_event, :post_wedding_address, presence: true
  enum religion_type: [:ANGLICAN, :BUDDHIST, :CATHOLIC, :HINDU, :MUSLIM, :NO_RELIGION, :OTHER, :PRESBYTERIAN]
  belongs_to :event

  def full_name
    "#{first_name} #{surname}"
  end

  def fiance_full_name
    "#{fiance_first_name} #{fiance_surname}"
  end
end
