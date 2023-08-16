Rails.application.routes.draw do
  get 'restock_alerts/new'
  get 'restock_alerts/create'
  get 'restock_alerts/edit'
  get 'restock_alerts/update'

  devise_for :users

  resources :warehouses
  resources :products do
    get :variation_for_product, on: :member
    resources :variations
  end 
  resources :inventories do
    resources :transactions, only: [:index, :new, :create ], controller: 'inventory_transactions'
    resources :restock_alerts, only: [:index, :new, :create, :destroy, :edit, :update]
  end
  


  # scope module: 'api/v1' do
  #   resources :warehouses, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  # end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home/about', as: 'about' 
  root "home#index"

end
