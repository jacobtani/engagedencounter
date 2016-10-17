class AddDietaryRequirementsAttendee < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :dietary_requirements, :string
  end
end
