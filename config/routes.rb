Rails.application.routes.draw do
  #Routes for static controller
  get 'home', to: 'pages#home', as: 'home'

  #Routes for auction controller
  get 'auctions', to: 'auctions#index', as: 'auctions'

  #Routes for user controller

  #Routes for user_auction controller
  get 'user/auctions', to: 'user_auctions#index', as: 'user_auctions'
  get 'user/auctions/new', to: 'user_quizzes#new', as: 'new_auction'
  post 'user/auctions', to: 'user_auctions#create'
  get 'user/auctions/:id', to: 'user_auctions#show', as: 'auction'
  get 'user/auctions/:id/edit', to: 'user_auctions#edit', as: 'edit_auction'
  patch 'user/auctions/:id', to: 'user_auctions#update'
  put 'user/auctions/:id', to: 'user_auctions#update' 
  delete 'user/auctions/:id', to: 'user_auctions#destroy'

  root to: redirect('/home', status: 302)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
