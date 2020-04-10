class TrainingsController < ApplicationController
  def index
    @trainings = Training.all

    # TODO move to update user webhook
    if params[:code]
      response = Stripe::OAuth.token({
        grant_type: 'authorization_code',
        code: params[:code],
      })

      if response.stripe_user_id
        current_user.update(stripe_user_id: response.stripe_user_id, stripe_meta: response.to_json)
      end
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
