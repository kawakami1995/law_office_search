Rails.application.routes.draw do
  root 'top#index'
  get '/user/new', to:'users#new'
  post '/user', to:'users#create'
  get '/user/:id', to:'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
