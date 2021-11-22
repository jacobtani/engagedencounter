class Event < ApplicationRecord
  validates :event_date, :location, presence: true
  has_many :registered_couples, dependent: :destroy
end
