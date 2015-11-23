Rails.application.routes.draw do


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root 'home#welcome'

  match 'home/welcome' => 'home#welcome', :via => [:get]

  resources :users, only: [:show] do
    resources :deployments, only: [:index, :show, :new, :create]
  end


  namespace :admin do
    resources :users, only: [:index, :new, :create]
  end

end
