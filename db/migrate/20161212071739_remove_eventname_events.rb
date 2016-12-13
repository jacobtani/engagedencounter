class RemoveEventnameEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :event_name
  end
end
