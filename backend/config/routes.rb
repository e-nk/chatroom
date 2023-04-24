Rails.application.routes.draw do
  # get 'message/create'
  # get 'message/update'
  # get 'message/destroy'
  # get 'message/reply'
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"

  #admin actions
  get "/banned_users", to: "admin#banned_users"
  post "/ban_user", to: "admin#ban_user"
  post "/unban_user", to: "admin#unban_user"

   # Custom routes for chatroom controller
   get '/chatroom', to: 'chatroom#index'
   get '/chatroom/:id', to: 'chatroom#show'
   post '/chatroom', to: 'chatroom#create'
   patch '/chatroom/:id', to: 'chatroom#update'
   delete '/chatroom/:id', to: 'chatroom#destroy'
   # Custom routes for message controller
  post '/message', to: 'message#create'
  patch '/message/:id', to: 'message#update'
  delete '/message/:id', to: 'message#destroy'
  post '/message/:id/reply', to: 'message#reply'
  # Custom routes for reports controller
  get '/reports', to: 'reports#index'
  post '/reports', to: 'reports#create'
  patch '/reports/:id', to: 'reports#update'
  delete '/reports/:id', to: 'reports#destroy'
  # post '/reports/:id/ban', to: 'reports#ban_user'
  # post '/reports/:id/unban', to: 'reports#unban_user'
  
end
