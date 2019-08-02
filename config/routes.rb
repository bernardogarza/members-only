# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'
  get 'sessions/new'
  post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get 'signout' => 'sessions#destroy'

  get 'static_pages/index'

  resources :posts, only: %i[index new create]
end
