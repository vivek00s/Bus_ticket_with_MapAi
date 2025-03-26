class LineItemsController < ApplicationController
  before_action :set_cart, only: %i[create]
  before_action :set_line_item, only: %i[show edit update destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    bus = Bus.find(params[:bus_id]) # Fetch the selected bus
    @line_item = @cart.line_items.find_by(bus_id: bus.id)
  
    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1) # Increase quantity
    else
      @line_item = @cart.line_items.build(bus: bus, quantity: 1) # Start with 1
    end
  
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart, notice: "Bus added to cart successfully." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { redirect_to bus_path(bus), alert: "Failed to add bus to cart." }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end



  def increase_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.update(quantity: @line_item.quantity + 1)
    redirect_to cart_path(@line_item.cart), notice: "Quantity increased."
  end
  
  def decrease_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.update(quantity: @line_item.quantity - 1)
    else
      @line_item.destroy # Remove the item if quantity becomes 0
    end
    redirect_to cart_path(@line_item.cart), notice: "Quantity updated."
  end
  

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy! # Directly remove the item
  
    respond_to do |format|
      format.html { redirect_to cart_path(@line_item.cart), notice: "Item removed from cart." }
      format.json { head :no_content }
    end
  end
  
  private

    # Find current cart
    def set_cart
      @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = @cart.id
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find_by(id: params[:id])
      redirect_to root_path, alert: "Line item not found" unless @line_item
    end

    # Strong parameters
    def line_item_params
      params.require(:line_item).permit(:cart_id, :bus_id, :quantity)
    end
end
