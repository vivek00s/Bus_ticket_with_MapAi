class PaymentMailer < ApplicationMailer
  def payment_success(first_name, last_name, amount)
    @first_name = first_name
    @last_name = last_name
    @amount = amount.to_f / 100  # Convert cents to dollars if needed

    mail(to: "vivekk12112@gmail.com", subject: 'Payment Confirmation')
  end
end
