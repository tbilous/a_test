Rails.application.routes.draw do
  resources :offers, only: %i(index create update edit)
  root 'offers#index'
end
