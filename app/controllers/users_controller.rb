class UsersController < ApplicationController
  def index
    @trainings = Training.all

    if params[:code]
      response = Stripe::OAuth.token({
        grant_type: 'authorization_code',
        code: params[:code],
      })

      pp '@@@@@@@@@@@@@@@'
      pp '@@@@@@@@@@@@@@@'
      pp response
      pp '@@@@@@@@@@@@@@@'
      pp '@@@@@@@@@@@@@@@'
      # {
      #   "access_token": "{ACCESS_TOKEN}",
      #   "livemode": false,
      #   "refresh_token": "{REFRESH_TOKEN}",
      #   "token_type": "bearer",
      #   "stripe_publishable_key": "{PUBLISHABLE_KEY}",
      #   "stripe_user_id": "{ACCOUNT_ID}",
      #   "scope": "express"
      # }

      # {
      #   "error": "invalid_grant",
      #   "error_description": "Authorization code does not exist: {AUTHORIZATION_CODE}"
      # }
    end
  end

  def create
    @training = Training.create(training_params)
  end

  private

  def training_params
    params.require(:training).permit(:user_id, :instructor_id)
  end
end


# response = Stripe::OAuth.token({
#   grant_type: 'authorization_code',
#   code: 'acct_1GWIkiJWIfJwKWT4',
#   assert_capabilities: ['transfers']
# })

# Stripe::Account.retrieve('acct_1GWIkiJWIfJwKWT4')
