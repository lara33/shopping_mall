Rails.application.routes.draw do
  root 'products#index'
  resources :products 
      
  resources :orders, only: [:index, :show, :new, :create]

  resource :cart, only: [:show, :destroy] do
    collection do
      post :add, path: "add/:id" 
      get :checkout #cart/checkout
    end
  end
end
