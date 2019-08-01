Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  # sources :sessions, only: %i[new create]
end
