class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      response = @user.id
    else
      response = 0
    end
    render json: response
  end
end
