class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
    checkout_params = {
      customer: User.first.stripe_customer_id,
      payment_method_types: ['card'],
      line_items: [{
        name: 'Training',
        description: 'Training with instructor',
        amount: 500,
        currency: 'usd',
        quantity: 1
      }],
      success_url: 'http://localhost:3000/trainings?stripe_session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'http://localhost:3000'
    }

    if Instructor.first.stripe_account_id.present?
      checkout_params.merge!(
        payment_intent_data: {
          application_fee_amount: 123,
          transfer_data: {
            destination: Instructor.first.stripe_account_id
          }
        },
        # on_behalf_of: Instructor.first.stripe_account_id
      )
    end

    checkout = Stripe::Checkout::Session.create(checkout_params)
    @checkout_guid = checkout.id
  end

  def create
    @training = Training.create(training_params)
  end

  private

  def training_params
    params.require(:training).permit(:user_id, :instructor_id)
  end
end
