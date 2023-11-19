Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  
  get '/users/account', to: 'users#account', as: 'account'
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

  get '/law_offices/index' ,to: 'law_offices#index'
  get '/law_offices/new' ,to: 'law_offices#new'
  post '/law_offices/create' ,to: 'law_offices#create'
  get '/law_offices/:id/show' ,to: 'law_offices#show', as: 'law_office_show'
  get '/law_offices/:id/edit', to: 'law_offices#edit', as: 'law_office_edit'
  patch '/law_offices/:id/update', to: 'law_offices#update', as: 'law_office_update'
  get 'law_offices/:id/destroy_confirm', to: 'law_offices#destroy_confirm', as: 'law_office_destroy_confirm'
  delete 'law_offices/:id/destroy', to: 'law_offices#destroy', as: 'law_office_destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
