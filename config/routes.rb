Rails.application.routes.draw do
  resources :members
  devise_for :users
  get 'welcome/index'
  
  root 'welcome#index'
  
  resources :users, :only => [:index, :show, :destroy]
end
