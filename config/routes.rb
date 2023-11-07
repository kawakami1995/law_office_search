Rails.application.routes.draw do
  root 'top#index'
  get '/user/index', to:'users#index'
  get '/user/new', to:'users#new'
  post '/user/create', to:'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
