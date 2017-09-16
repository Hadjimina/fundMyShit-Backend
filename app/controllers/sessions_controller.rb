class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user != nil
      if @user.password == params[:password]
        print "works!"
        response = @user.id
      else
        print "different doesnt work"
        response = 0
      end
    else
      response = 0
      print "it doesnt work!"
    end
    render json: response
  end
end
