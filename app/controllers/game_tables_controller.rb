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

  # POST /game_tables
  def create
    @game_table = GameTable.create!(create_params)
    render json: @game_table, status: :created
  end

  # PUT /game_tables/{id}
  def update
    @game_table = GameTable.find(params[:id])
    @game_table.update!(update_params)
    render json: @game_table, status: :ok
  end

  # GET /game/tables/{game_id}
  def show_game
    @game = GameTable.where(game_id: params[:game_id])
    render json: @game, status: :ok
  end

  private

  def create_params
    params.required(:game_tables).permit(:row, :column, :is_select, :is_mine, :is_band, :game_id)
  end

  def update_params
    params.required(:game_tables).permit(:is_select, is_band)
  end   
end
