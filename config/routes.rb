Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#index'

  namespace :admin do
    resources :votings
  end

  resources :votings, only: [:index, :show]
  resources :items, only: :update
end
