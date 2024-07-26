class TeamsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]


    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end

    def new
        @team = Team.new
        @team.players.build

    end
 
    def edit
        @team = Team.find(params[:id])
    end

    # create action 
    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to @team
        else
            render 'new'
        end
    end

    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to @team
        else
            render 'edit'
        end
    end

    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        redirect_to teams_path
    end

    private

    def team_params
    params.require(:team).permit(:name, :country, :founded, :description, players_attributes: [:id, :name, :age, :position, :role, :is_captain, :is_active, :description, :_destroy])
    end
end
