class GameTableSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :is_select, :is_mine, :is_band, :tables

  def tables
    game = self.object.game
    {
      name: game.name,
      rows: game.rows,
      columns: game.columns,
      mines: game.mines,
      score: game.score,
      status: game.status,
      id: game.id
    }
  end
end