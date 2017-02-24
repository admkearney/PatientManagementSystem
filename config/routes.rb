Rails.application.routes.draw do
  #this is a resourceful route which declares multiple routes in a single line
  resources :patients

  root 'patients#index'
end
