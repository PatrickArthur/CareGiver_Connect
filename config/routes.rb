Rails.application.routes.draw do


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :deployments, only: [:index, :show, :new, :create]
  end


  namespace :admin do
    resources :users, only: [:new, :create]
  end

end
