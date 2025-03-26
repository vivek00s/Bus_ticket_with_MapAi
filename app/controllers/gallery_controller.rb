class GalleryController < ApplicationController
  before_action :set_cart, only: [:index, :checkout]

  def index
    @buses_gallery = Bus.all  # Fetch all buses
  end

  def checkout
    amount_to_charge = session[:amount].to_i
    if request.post?
      ActiveMerchant::Billing::Base.mode = :test

      credit_card = ActiveMerchant::Billing::CreditCard.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        number: params[:credit_no].to_s,
        month: params[:check][:month].to_i,
        year: params[:check][:year].to_i,
        verification_value: params[:verification_number].to_i
      )

      gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
        login: 'TestMerchant',
        password: 'password',
        test: 'true'
      )

      response = gateway.authorize(amount_to_charge, credit_card)

      if response.success?
        gateway.capture(amount_to_charge, response.authorization)
        session[:cart_id] = nil
        session[:amount] = nil
        redirect_to action: :purchase_complete


        
        PaymentMailer.payment_success(params[:first_name], params[:last_name], amount_to_charge).deliver_now

      else
        flash[:notice] = "Something went wrong. Try again"
        render :checkout, status: :unprocessable_entity
      end
    end
  end

  def search
    keyword = "%#{params[:keyword]}%"
    @buses = Bus.where(
      "name LIKE ? OR source LIKE ? OR destination LIKE ? OR ticket_amount LIKE ?",
      keyword, keyword, keyword, keyword
    )
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = @cart.id
  end
end
