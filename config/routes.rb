Rails.application.routes.draw do
  resources :trainings, only: [:index, :create]

  namespace :stripe do
    resource :oauth, only: [:show]
  end
end
