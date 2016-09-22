Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :employees
  resources :addresses
  resources :trails
  resources :notes
  resources :comments
  resources :assignments

  mount_ember_app :trekclient, to: "/"
end
