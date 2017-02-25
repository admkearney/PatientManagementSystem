Rails.application.routes.draw do
  devise_for :users
  #this is a resourceful route which declares multiple routes in a single line
  resources :patients

  root 'patients#index'
end
