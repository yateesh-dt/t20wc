class MatchesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

    def index
      @teams = Team.all
      @matches = Match.includes(:team1, :team2)

      if params[:search].present?
        @matches = @matches.by_team1(params[:search][:team1_id]) if params[:search][:team1_id].present?
        @matches = @matches.by_team2(params[:search][:team2_id]) if params[:search][:team2_id].present?
        if params[:search][:start_date].present? && params[:search][:end_date].present?
          @matches = @matches.by_date_range(params[:search][:start_date], params[:search][:end_date])
        end
      end
    end

  def show
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to @match, notice: 'Match was successfully created.'
    else
      respond_to do |format|
          format.html { redirect_to matches_url, notice: "Match cannot be scheduled with past date." }
      end
      @teams = Team.all

      render :new
    end
  end

  def edit
    @teams = Team.all
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: 'Match was successfully updated.'
    else
      @teams = Team.all
      render :edit
    end
  end

  def destroy
    @match.destroy
    redirect_to matches_url, notice: 'Match was successfully destroyed.'
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:date, :location, :team1_id, :team2_id)
  end
end
