class PaymentsController < ApplicationController
  def create
    @payment = Payment.new
    @payment.amount = params[:amount]
    @payment.challenge_id = params[:challenge_id]
    @payment.payer_id = params[:payer_id]
    @payment.save!

    @payer = User.find_by_id(payer_id)
    @balance_1 = @payer.balance
    @payer.update_attributes(balance: ( @balance - @payment.amount) )

    50.times do
       p **
     end

    p @payer
    p @payer.balance
    @challenge = Challenge.find_by_id(challenge_id)
    @challenger = User.find_by_id(@challenge.challenger.id)

    50.times do 
      p **
    end
    p @challenger
    p @challenger.balance
    @balance_2 = @challenger.balance
    @challenger.update_attributes(balance: (@balance + @payment.amount) )
    render json: 1
  end
end
