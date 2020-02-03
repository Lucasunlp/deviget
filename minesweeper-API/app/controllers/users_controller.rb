class UsersController < ApplicationController
  before_action :authenticate_request

  def create
    user = User.new(user_params)
    if user.save
      head :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity # 422 semantically erroneous https://httpstatuses.com/422
    end
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def user_params
    params.require(:users).permit(:name, :email, :password)
  end
end
