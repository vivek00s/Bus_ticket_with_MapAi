class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :bus

  def total_price
    return 0 unless bus.present? # Prevents nil error
    bus.ticket_amount * quantity
  end
  

end