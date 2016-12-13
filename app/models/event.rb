class Event < ApplicationRecord
  validates :event_date, :location, presence: true
end
