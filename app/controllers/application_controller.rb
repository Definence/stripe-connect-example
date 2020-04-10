class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= Instructor.first
  end
end
