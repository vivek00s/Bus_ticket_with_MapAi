class BusesController < ApplicationController
  before_action :set_bus, only: %i[ show edit update destroy ]

  # GET /buses or /buses.json
  def index
    @buses = Bus.all
  end

  # GET /buses/1 or /buses/1.json
  def show
    
  end


 

  # GET /buses/new
  def new
    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
  end

  # POST /buses or /buses.json
  def create
    @bus = Bus.new(bus_params)

    respond_to do |format|
      if @bus.save

        BusMailer.bus_creation_email(@bus).deliver_now

        
        format.html { redirect_to @bus, notice: "Bus was successfully created." }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1 or /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: "Bus was successfully updated." }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1 or /buses/1.json
  def destroy
    @bus.destroy!

    respond_to do |format|
      format.html { redirect_to buses_path, status: :see_other, notice: "Bus was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bus_params
      params.require(:bus).permit(:name, :source, :destination, :seats, :seat_type, :bus_type, :ticket_amount, :departure_time, :arrival_time, :image)
    end
end
