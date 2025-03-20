class SupportTeamsController < ApplicationController
  before_action :set_support_team, only: %i[ show edit update destroy ]

  # GET /support_teams or /support_teams.json
  def index
    @support_teams = SupportTeam.all
  end

  # GET /support_teams/1 or /support_teams/1.json
  def show
  end

  # GET /support_teams/new
  def new
    @support_team = SupportTeam.new
  end

  # GET /support_teams/1/edit
  def edit
  end

  # POST /support_teams or /support_teams.json
  def create
    @support_team = SupportTeam.new(support_team_params)

    respond_to do |format|
      if @support_team.save
        format.html { redirect_to @support_team, notice: "Support team was successfully created." }
        format.json { render :show, status: :created, location: @support_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /support_teams/1 or /support_teams/1.json
  def update
    respond_to do |format|
      if @support_team.update(support_team_params)
        format.html { redirect_to @support_team, notice: "Support team was successfully updated." }
        format.json { render :show, status: :ok, location: @support_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_teams/1 or /support_teams/1.json
  def destroy
    @support_team.destroy!

    respond_to do |format|
      format.html { redirect_to support_teams_path, status: :see_other, notice: "Support team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_team
      @support_team = SupportTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def support_team_params
      params.require(:support_team).permit(:name, :role, :branch, :phone_number, :email, :image)
    end
end
