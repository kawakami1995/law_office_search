Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  post '/users/create', to:'users#create'
  get '/users/account', to:'users#account', as: 'account'
  get '/users/account/user_name_edit',to: 'users#user_name_edit', as: 'user_name_edit'
  patch '/users/account/user_name_update', to: 'users#user_name_update', as: 'user_name_update'
  get '/users/account/email_edit', to: 'users#email_edit', as: 'email_edit'
  patch '/users/account/email_update', to: 'users#email_update', as: 'email_update'
  get 'users/account/destroy_confirm', to: 'users#destroy_confirm', as: 'user_destroy_confirm'
  delete '/users/account/destroy', to: 'users#destroy', as: 'user_destroy'

  get "/users/sign_in",to:"devise/sessions#new"
  post "/users/sign_in",to:"evise/sessions#create"
  delete "/users/sign_out",to:"devise/sessions#destroy"
  get "/users/password/new",to:"devise/passwords#new"
  get "/users/password/edit",to:"devise/passwords#edit"
  patch "/users/password",to:"devise/passwords#update"
  put "/users/password",to:"devise/passwords#update"
  post "/users/password",to:"devise/passwords#create"
  get "/users/cancel",to:"devise/registrations#cancel"
  get "/users/sign_up",to:"devise/registrations#new"
  get "/users/edit",to:"devise/registrations#edit"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
