Rails.application.routes.draw do
   #all of the routes except for show
  resources :portfolios, except: [:show]
  #here is the custom route for show, it changes /portfolios/4 to /portfolio/4
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' 
  
  #these are the same
  #get 'pages/about'
  get 'about-me', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' #setting root path (home page)
end
