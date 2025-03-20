class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.integer :seats
      t.string :seat_type
      t.string :bus_type
      t.decimal :ticket_amount
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
