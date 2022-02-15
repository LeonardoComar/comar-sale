# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "main#index"
  resources :dashboard, only: %i[index]
  resources :products
  resources :shippings
  resources :customers do
    post '/credit', to: 'customers#new_credit'
  end
end
