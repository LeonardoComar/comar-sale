# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "main#index"
  resources :dashboard, only: %i[index]
  resources :customers, only: %i[index new create show]
end
