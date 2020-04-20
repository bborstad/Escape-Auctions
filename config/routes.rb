Rails.application.routes.draw do
  #Routes for static controller
  get 'home', to: 'pages#home', as: 'home'

  #Routes for auction controller
  get 'auctions', to: 'auctions#index', as: 'auctions' #index

  #Routes for user controlloer

  root to: redirect('/home', status: 302)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
