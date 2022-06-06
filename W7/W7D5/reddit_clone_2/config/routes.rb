Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :new, :destroy]

  resources :subs, only: [:index, :show, :new, :create, :edit, :update]
  resources :posts, except: [:index]




end
