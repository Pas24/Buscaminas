class GameTablesController < ApplicationController
        
  # GET /game_tables
  def index
    @game_tables = GameTable.all
    #Solucionar N+1 problem
    render json: @game_tables, status: :ok
  end

  # GET /game_tables/{id}
  def show
    @game_table = GameTable.find(params[:id])
    render json: @game_table, status: :ok
  end

  # PUT /game_tables/{id}
  def update
    @game_table = GameTable.find(params[:id])
    @game_table.update is_select: params[:is_select]
    @game_table.update is_band: params[:is_band]
    render json: @game_table, status: :ok
  end

  # GET /game/tables/{game_id}
  def show_game
    @game = GameTable.where(game_id: params[:game_id])
    render json: @game, status: :ok
  end
end