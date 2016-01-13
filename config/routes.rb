Rails.application.routes.draw do
  get '/', to: "profiles#new"
  root to: "profiles#new"
end
