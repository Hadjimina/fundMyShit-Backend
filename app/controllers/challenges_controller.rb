class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all

    @challenges = @challenges.map do |challenge|
      challenge.add_current_price
      challenge.check_completed
    end

    render json: @challenges
  end

  def show
    @challenge = Challenge.find_by_id(params[:id])
    @challenge.add_current_price
    @challenge.check_completed

    render json: @challenge
  end

  def create
    @challenge = Challenge.new
    @challenge.title = params[:title]
    @challenge.description = params[:description]
    @challenge.price = params[:price]
    @challenge.price = params[:user_id]
    @challenge.save!

    render json: 1
  end

  def user_challenges
    @user = User.find_by_id(params[:user_id])
    @challenges = @user.challenges

    @challenges = @challenges.map do |challenge|
      challenge.add_current_price
      challenge.check_completed
    end
      render json: @challenges
  end

  def payed_challenges
    @user = User.find_by_id(params[:user_id])
    @challenges = @user.payed_challenges

    @challenges = @challenges.map do |challenge|
      challenge.add_current_price
      challenge.check_completed
    end
      render json: @challenges
      
  end
end
