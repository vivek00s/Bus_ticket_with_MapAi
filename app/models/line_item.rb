class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :bus

  # Ensures quantity is at least 1 (default value)
  before_save :set_default_quantity

  # Calculates total price of the item in the cart
  def total_price
    bus&.ticket_amount.to_i * quantity
  end

  private

  # Sets a default quantity of 1 if it's not set
  def set_default_quantity
    self.quantity ||= 1
  end
end
