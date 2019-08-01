Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  post '/sessions' => 'sessions#create'
  delete 'sessions/destroy'
  get 'static_pages/index'
  # sources :sessions, only: %i[new create]
end
