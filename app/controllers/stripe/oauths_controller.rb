class Stripe::OauthsController < ApplicationController
  def show
    ext_account = Stripe::OAuth.token(grant_type: 'authorization_code', code: params[:code])
    current_user.update(stripe_account_id: ext_account.stripe_user_id, stripe_meta: ext_account.to_json)
    redirect_to :trainings
  rescue Stripe::OAuth::InvalidGrantError
    render json: { error: "Invalid authorization code: #{params[:code]}" }, status: 400
  rescue Stripe::StripeError
    render json: { error: 'An unknown error occurred' }, status: 500
  end
end
