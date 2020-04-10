class Stripe::UsersController < ApplicationController
  def show
    user = Stripe::OAuth.token(
      grant_type: 'authorization_code',
      code: params[:code]
    )

    if user.stripe_user_id.present?
      current_user.update(stripe_user_id: user.stripe_user_id, stripe_meta: user.to_json)
    end

    redirect_to :trainings
  end
end
