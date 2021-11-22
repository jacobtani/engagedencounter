class AddFianceFieldsToAttendees < ActiveRecord::Migration[6.1]
  def change
    add_column :attendees, :fiance_preferred_name, :string, null: false
    add_column :attendees, :fiance_first_name, :string, null: false
    add_column :attendees, :fiance_surname, :string, null: false
    add_column :attendees, :fiance_age, :integer
    add_column :attendees, :fiance_email, :string, null: false
    add_column :attendees, :fiance_address, :text, null: false
    add_column :attendees, :fiance_phone_number, :string, null: false
    add_column :attendees, :fiance_religion, :string, null: false
    add_column :attendees, :fiance_parish, :string
    remove_column :attendees, :fiance_full_name, :string
  end
end
