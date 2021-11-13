class AddPreferredNameToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :preferred_name, :string
  end
end
