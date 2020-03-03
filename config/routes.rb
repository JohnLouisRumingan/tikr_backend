Rails.application.routes.draw do
  get 'companies/index'
  get 'companies/show'
  get 'prices/index'
  get 'prices/show'
  get 'users/index'
  get 'users/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, :shares, :companies, :prices, only: [:show, :index]
  
  namespace :auth do 
    
    post '/login', to: 'auth#fake_create'
  end 
end
