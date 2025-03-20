json.extract! bus, :id, :name, :source, :destination, :seats, :seat_type, :bus_type, :ticket_amount, :departure_time, :arrival_time, :created_at, :updated_at
json.url bus_url(bus, format: :json)
