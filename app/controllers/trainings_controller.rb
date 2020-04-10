class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def create
    @training = Training.create(training_params)
  end

  private

  def training_params
    params.require(:training).permit(:user_id, :instructor_id)
  end
end
