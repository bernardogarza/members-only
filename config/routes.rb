Rails.application.routes.draw do
  root 'sessions#new'
  get 'sessions/new'
  post '/sessions' => 'sessions#create'
  delete 'sessions/destroy'
  # sources :sessions, only: %i[new create]
end
