Rails.application.routes.draw do
  resources :trainings, only: [:index, :create]

  namespace :connect do
    resource :oauth, only: [:show]
  end
end
