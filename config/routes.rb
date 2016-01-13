Rails.application.routes.draw do
  get '/', to: 'profiles#new'
  post '/', to: 'profiles#create'
  get '/profile', to: 'profiles#show'
  root to: 'profiles#new'
end
