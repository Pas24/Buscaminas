class GamesController < ApplicationController
  module Status
    PROGRESS = 1
    LOSE = 2
    WIN = 3
  end

  # GET /games
  def index
    @games = Game.where(status: Status::PROGRESS)
    #Solucionar N+1 problem
    render json: @games, status: :ok
  end

  # GET /games/{id}
  def show
    @game = Game.find(params[:id])
    render json: @game, status: :ok
  end

  # POST /games
  def create
    @game = Game.create!(create_params)
    tables = []

    @game.rows.times do |row|
      @game.columns.times do |column|
        table = GameTable.new :row => row, :column => column, :is_select => 0, :is_mine => false, :is_band => false, :game_id => @game.id
        tables << table
      end
    end

    tables = set_mine(tables, @game)

    tables.each do |table|
      table.save!
    end

    render json: tables, status: :created
  end

  def set_mine(tables, game)
    count_min = 0
    random = Random.new

    begin
      random_row = random.rand(0...@game.rows-1)
      random_column = random.rand(0...@game.columns-1)
      
      tables.each do |table|
        if random_row == table.row && random_column == table.column
          if table.is_mine == false
            table.is_mine = true
            count_min = count_min + 1
            break
          end
        end
      end
    end while count_min < @game.mines

    tables
  end

  # PUT /games/{id}
  def update
    @game = Game.find(params[:id])
    @game.update!(update_params)
    render json: @game, status: :ok
  end

  private

  def create_params
    params.required(:game).permit(:name, :rows, :columns, :mines, :score, :status)
  end

  def update_params
    params.required(:game).permit(:score, :status)
  end
end