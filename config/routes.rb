Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :products
      resources :warehouses
      resources :inventories
      resources :variations
      resources :restock_alerts
    end
  end

  devise_for :users

  resources :warehouses
  # scope module: 'api/v1' do
  #   resources :warehouses, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  # end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home/about', as: 'about' 
  root "home#index"

end
