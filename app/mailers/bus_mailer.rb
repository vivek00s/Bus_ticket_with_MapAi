class BusMailer < ApplicationMailer
  def bus_creation_email(bus)
    @bus = bus
    mail(to: "recipient@example.com", subject: "New Bus Created Successfully")
  end
  end