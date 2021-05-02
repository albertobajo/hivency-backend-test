class Api::V1::GamesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @games = pagy(Game.all)
    @count = @games.count
    @metadata = pagy_metadata(@pagy)
  end

  def create
    Game.create(moves_attributes: [move_params])
  end

  private

  def move_params
    params.permit(:name, :move)
  end
end
