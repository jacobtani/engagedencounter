class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :event_date, null: false
      t.string :event_name, null: false
      t.string :location, null: false
    end
  end
end
