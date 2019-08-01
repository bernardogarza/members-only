Rails.application.routes.draw do
  root 'static_pages#index'
  get 'sessions/new'
  post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get 'static_pages/index'
  # resources :sessions, only: %i[new create destroy]

end
