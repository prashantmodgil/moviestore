Rails.application.routes.draw do
get 'movies/detail' => 'movies#detail',as: :movies_detail
  devise_for :users
  resources :movies do
    resources :comments
  end

  root 'movies#index'
end
