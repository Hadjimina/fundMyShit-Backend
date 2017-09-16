class PaymentsController < ApplicationController
  def create
    @payment = Payment.new
    @payment.amount = params[:amount]
    @payment.challenge_id = params[:challenge_id]
    @payment.payer_id = params[:payer_id]

    render json: 1
  end
end
