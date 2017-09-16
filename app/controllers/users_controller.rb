class UsersController < ApplicationController

  def create
    @user = User.new
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = params[:password_hash]
    if @user.save!
      response = @user.id
    else
      response = 0
    end
    render json: response
  end

  def show
    @user = User.find_by_id(params[:id])

    render json: @user
  end
end
