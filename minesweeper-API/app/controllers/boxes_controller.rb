class BoxesController < ApplicationController
  def index
    render json: @current_user.games.find(params[:game_id]).boxes
  end
end
