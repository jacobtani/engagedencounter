class ChangeAttendeesToRegisteredCouples < ActiveRecord::Migration[6.1]
  def change
    rename_table :attendees, :registered_couples
  end
end
