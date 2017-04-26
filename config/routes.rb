Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/facts' => 'facts#index'
  post '/facts' => 'facts#create'

  get '/profile' => 'users#show'

  root "static_pages#home"
end
