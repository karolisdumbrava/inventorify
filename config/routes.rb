Rails.application.routes.draw do

  devise_for :users

  resources :warehouses
  resources :products do
    get :variation_for_product, on: :member
    resources :variations
  end 
  resources :inventories

  # scope module: 'api/v1' do
  #   resources :warehouses, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  # end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home/about', as: 'about' 
  root "home#index"

end
