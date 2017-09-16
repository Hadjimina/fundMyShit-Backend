class ChallengesController < ApplicationController
  include ChallengesHelper
  def index
    ChallengesHelper.delete_old_challenges
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
    @challenge.title = params[:title].gsub('+',' ')
    @challenge.description = params[:description].gsub('+',' ')
    @challenge.price = params[:price]
    @challenge.challenger_id = params[:user_id]
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

      # @challenges =  @challenges.sort_by { |a| a.complete ? 0 : 1 }

      render json: @challenges
  end

  def payed_challenges
    @user = User.find_by_id(params[:user_id])
    @challenges = @user.payed_challenges

    @challenges = @challenges.map do |challenge|
      challenge.add_current_price
      challenge.check_completed
    end

      # @challenges =  @challenges.sort_by { |a| a.complete ? 0 : 1 }


      render json: @challenges

  end

  def add_video
    @challenge = Challenge.find_by_id(params[:id])
    @challenge.update(video: params[:video])

    render json: 1
  end

end
