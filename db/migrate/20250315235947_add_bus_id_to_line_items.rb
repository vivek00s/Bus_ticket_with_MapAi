class AddBusIdToLineItems < ActiveRecord::Migration[7.1]
  def change
    add_column :line_items, :bus_id, :integer
  end
end
