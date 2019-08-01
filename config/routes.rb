Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  # sources :sessions, only: %i[new create]
end
