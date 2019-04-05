class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
       render json: {user: @user}, status: :created
     else
       render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
   end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :phone, :password)
  end
end
