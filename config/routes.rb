Rails.application.routes.draw do

  resources :movies

  root 'movie#index'
end
