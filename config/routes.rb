Rails.application.routes.draw do
 match '/admin/movies' => 'movies#create', via: :post
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'movies/detail' => 'movies#detail',as: :movies_detail
  get 'movies/more' => 'movies#more' ,as: :movies_more
  devise_for :users
  resources :movies do
    resources :comments
  end

  root 'movies#index'
end
