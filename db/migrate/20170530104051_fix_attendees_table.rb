class FixAttendeesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :attendees, :event_id, :integer
    add_reference :attendees, :event, index: true
  end
end
