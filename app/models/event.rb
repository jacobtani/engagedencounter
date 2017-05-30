class Event < ApplicationRecord
  validates :event_date, :location, presence: true
  has_many :attendees, dependent: :destroy
end
