class PhonesController < ApplicationController
  before_action :set_phone, only: %i[show edit update destroy]
  before_action :admin_logged_in?

  def index
    @phones = Phone.all
  end

  def show; end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      redirect_to @phone, notice: "Phone was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @phone.update(phone_params)
      redirect_to @phone, notice: "Phone was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @phone.destroy
    redirect_to phones_url, notice: "Phone was successfully deleted."
  end

  private

  def set_phone
    @phone = Phone.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:name, :price, :description, :image)
  end

  def admin_logged_in?
    if session[:admin].nil?
      flash[:notice] = "you need to login as an admin to continue"
      redirect_to :controller => :admin, :action => :login
    end
  end
end
