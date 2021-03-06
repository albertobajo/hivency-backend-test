class Api::V1::GamesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @games = pagy(Game.all.includes(:moves))
    @count = @pagy.count
    @metadata = pagy_metadata(@pagy, absolute: true)
  end

  def create
    @game = Game.new(moves_attributes: [move_params, bot_move_params])
    @game.play
    @game.save!

    render :show, status: :created
  end

  private

  def move_params
    params.permit(:name, :move)
  end

  def bot_move_params
    { name: 'Bot', move: Move.moves.keys.sample }
  end
end
