class PaymentsController < ApplicationController
  def create
    @payment = Payment.new
    @payment.amount = params[:amount]
    @payment.challenge_id = params[:challenge_id]
    @payment.payer_id = params[:payer_id]
    @payment.save!

    @payer = User.find_by_id(payer_id)
    @payer.update_attributes(balance: @payer.balance - @payment.amount )

    @challenge = Challenge.find_by_id(challenge_id)

    @challenger = User.find_by_id(payer_id)
    @challenger.update_attributes(balance: @challenger.balance + @payment.amount )
    render json: 1
  end
end
