Rails.application.routes.draw do
  resources :trainings, only: [:index, :create]

  namespace :stripe do
    resource :user, only: [:show]
  end
end
