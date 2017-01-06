Rails.application.routes.draw do

  root :to => 'application#home'

    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    post '/attraction/:id', to: 'attractions#update_user', as: 'update_user'

    resources :users
    resources :attractions

end
