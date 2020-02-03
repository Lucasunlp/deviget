class GamesController < ApplicationController
  def index
    render json: current_user.games.order('created_at desc')
  end

  def create
    game = Game.new(game_params)
    game.user = current_user
    game.status = game::statuses[:playing]
    if game.save
      head :created
    else
      render json: game.errors.full_messages, status: :unprocessable_entity # 422 semantically erroneous https://httpstatuses.com/422
    end
  end

  def destroy
    game = current_user.games.find(params[:id])
    if game.destroy
      head :ok
    else
      render json: error_message, status: :unprocessable_entity # 422 semantically erroneous https://httpstatuses.com/422
    end
  end

  private

  def game_params
    params.require(:game).permit(:width, :height, :cant_mines)
  end
end
