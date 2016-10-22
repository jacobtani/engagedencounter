class FixWeddingDateAttendee < ActiveRecord::Migration[5.0]
  def change
    remove_column :attendees, :wedding_date
    add_column :attendees, :wedding_date, :date
    remove_column :events, :event_date
    add_column :events, :event_date, :string
  end
end
