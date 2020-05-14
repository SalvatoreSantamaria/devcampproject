Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
     #all of the routes except for show
  resources :portfolios, except: [:show] do
    #for the route portfolios/sort
    put :sort, on: :collection 
  end
  get 'angular-items', to: 'portfolios#angular'
  #here is the custom route for show, it changes /portfolios/4 to /portfolio/4
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' 
  
  #these are the same
  #get 'pages/about'
  get 'about-me', to: 'pages#about'

  get 'contact', to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  root to: 'pages#home' #setting root path (home page)
end
