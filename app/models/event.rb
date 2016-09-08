class Event < ApplicationRecord
  validates :event_date, :event_name, :location, presence: true
end