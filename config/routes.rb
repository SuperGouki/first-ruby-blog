Rails.application.routes.draw do
  root 'pages#welcome'
  get '/skills', to: 'skills#index'
end
