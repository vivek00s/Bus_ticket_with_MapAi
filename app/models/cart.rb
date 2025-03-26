class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # Add a bus to the cart or increase quantity if it already exists
  def add_bus(bus_id)
    current_item = line_items.find_or_initialize_by(bus_id: bus_id)
    current_item.quantity += 1
    current_item.save!
    current_item
  end

  # Calculate total price of all items in the cart
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  # Remove a bus from the cart (optional)
  def remove_bus(bus_id)
    current_item = line_items.find_by(bus_id: bus_id)
    return unless current_item

    if current_item.quantity > 1
      current_item.quantity -= 1
      current_item.save!
    else
      current_item.destroy
    end
  end
end
