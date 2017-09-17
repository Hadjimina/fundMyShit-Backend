class PaymentsController < ApplicationController
  def create
    @payment = Payment.new
    @payment.amount = params[:amount]
    @payment.challenge_id = params[:challenge_id]
    @payment.payer_id = params[:payer_id]
    @payment.save!

    @payer = User.find_by_id(params[:payer_id])
    @balance_1 = @payer.balance
    @payer.update_attributes(balance: ( @balance_1 - @payment.amount) )

    @challenge = Challenge.find_by_id(params[:challenge_id])
    @challenger = User.find_by_id(@challenge.challenger.id)

    @balance_2 = @challenger.balance
    @challenger.update_attributes(balance: (@balance_2 + @payment.amount) )
    render json: 1
  end
end
