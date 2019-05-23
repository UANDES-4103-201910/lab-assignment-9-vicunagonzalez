Rails.application.routes.draw do
  get 'events', to: 'events#index'
  get 'events/new',to: 'events#new'
  post 'events', to: 'events#create'
  get 'tickets', to: 'tickets#index'
  get 'tickets/new', to: 'tickets#new'
  post 'tickets', to: 'tickets#create'

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  root :to => 'events#index'

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in


end
