class RelaxConstraintWeddingDateAttendee < ActiveRecord::Migration[5.0]
  def change
    change_column :attendees, :wedding_date, :string, :null => true
  end
end
