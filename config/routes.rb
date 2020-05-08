Rails.application.routes.draw do
  #Devise routes
  devise_for :users
  
  #Routes for Static controller (general-purpose pages)
  get 'home', to: 'pages#home', as: 'home'
  #get 'contact', to: 'pages#contact', as: 'contact'
  #get 'about', to: 'pages#about', as: 'about'

  #Routes for Auction controller (general purpose auctions controller/no login necessary to view)
  get 'auctions', to: 'auctions#index', as: 'auctions'
  get 'auctions/:id', to: 'auctions#show', as: 'details'

  #Routes for User controller (pages related to user)

  #Routes for User_auction controller (user specific auctions)
  get 'user/auctions', to: 'user_auctions#index', as: 'user_auctions'
  get '/user/auctions/new/', to: 'user_auctions#new', as: 'new_auction'
  post 'user/auctions', to: 'user_auctions#create'
  get 'user/auctions/:id', to: 'user_auctions#show', as: 'auction'
  get 'user/auctions/:id/edit', to: 'user_auctions#edit', as: 'edit_auction'
  patch 'user/auctions/:id', to: 'user_auctions#update'
  put 'user/auctions/:id', to: 'user_auctions#update' 
  delete 'user/auctions/:id', to: 'user_auctions#destroy'

  get '/search' => 'search#search', :as => 'search_page'

  post 'auctions/:id/bid' => 'bids#create'
  get 'user/bids/' => 'bids#show', :as => 'user_bids'

  #Routes for User Review Controller 
  get 'user/reviews/', to: 'user_reviews#index', as: 'user_reviews'
  get 'user/review/submission', to: 'user_reviews#submission', as: 'submission'
  post 'user/review/submission', to: 'user_reviews#update', as: 'update'

  get 'purchased/:id', to: 'user_auctions#purchase', as: 'purchase'
 
  
 
  get 'reviews/index', to: 'reviews#index', as: 'reviews'
  get 'auctions/:id/reviews/reviewleft', to: 'reviews#reviewleft', as: 'reviewleft'
  get 'auctions/:id/reviews/new', to: 'reviews#new', as: 'new_review' # new review
  post 'auctions/:id/reviews/', to: 'reviews#create'
  
  get 'reviews/:id', to: 'reviews#show', as: 'review'
  delete 'reviews/:id', to: 'reviews#destroy'

  


  #Root route
  root to: redirect('/home', status: 302)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
