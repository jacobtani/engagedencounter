class AddEventToAttendee < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :event_id, :integer
    add_index :attendees, :event_id
  end
end
