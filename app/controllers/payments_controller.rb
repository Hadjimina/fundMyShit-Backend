class PaymentsController < ApplicationController
  def create
    @payment = Payment.new
    @payment.amount = params[:amount]
    @payment.challenge_id = params[:challenge_id]
    @payment.payer_id = params[:payer_id]
    @payment.save!

    @user = User.find_by_id(payer_id)
    @user.update_attributes(balance: @user.balance - @payment.amount )

    render json: 1
  end
end
