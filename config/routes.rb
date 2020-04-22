Rails.application.routes.draw do
  #Devise routes
  devise_for :users
  
  #Routes for Static controller (general-purpose pages)
  get 'home', to: 'pages#home', as: 'home'
  #get 'contact', to: 'pages#contact', as: 'contact'
  #get 'about', to: 'pages#about', as: 'about'

  #Routes for Auction controller (general purpose auctions controller/no login necessary to view)
  get 'auctions', to: 'auctions#index', as: 'auctions'


  #Routes for User controller (pages related to user)

  #Routes for Auction_item & Items controller (auction specific item)
   get 'auction/:id/item', to: 'auction_item#index', as: 'auction_items'
   get 'auction/:id/item/new', to: 'auction_item#new', as: 'new_auction_item'
   post 'auction/:id/item', to: 'auction_item#create'
   get 'item/:id', to: 'item#show', as: 'item'
   get 'item/:id/edit', to: 'item#edit', as: 'edit_item'
   patch 'item/:id', to: 'item#update'
   put 'item/:id', to: 'item#update'
   delete 'item/:id', to: 'item#destroy'

  #Routes for User_auction controller (user specific auctions)
  get 'user/auctions', to: 'user_auctions#index', as: 'user_auctions'
  get '/user/auctions/new/', to: 'user_auctions#new', as: 'new_auction'
  post 'user/auctions', to: 'user_auctions#create'
  get 'user/auctions/:id', to: 'user_auctions#show', as: 'auction'
  get 'user/auctions/:id/edit', to: 'user_auctions#edit', as: 'edit_auction'
  patch 'user/auctions/:id', to: 'user_auctions#update'
  put 'user/auctions/:id', to: 'user_auctions#update' 
  delete 'user/auctions/:id', to: 'user_auctions#destroy'


  #Root route
  root to: redirect('/home', status: 302)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
