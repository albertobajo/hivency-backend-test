class Api::V1::GamesController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @games = pagy(Game.all)
    @count = @games.count
    @metadata = pagy_metadata(@pagy)
  end
end
