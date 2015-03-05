Rails.application.routes.draw do
  get 'users/test' => 'users#test', as: :users_test
  get 'users/test2' => 'users#test2',as: :users_test2

  root 'home#index'
  post 'home/basicsearch' => 'home#basicsearch',as: :home_basicsearch
  get 'home/advancedsearch'=> 'home#advancedsearch', as: :home_advancedsearch
  post 'home/searchresult' => 'home#searchresult', as: :home_searchresult

  get 'users/logout' =>'users#logout',as: :users_logout
  post 'users/authenticate' =>'users#authenticate'
  get 'users/login' => 'users#login', as: :users_login
  get 'users/new' => 'users#new' , as: :users_new
  post 'users' => 'users#create'
  get 'users/admin' => 'users#index', as: :users_admin
  post 'users/change' =>'users#change'
  get 'users/modify/:id' =>'users#modify', as: :users_modify
  get 'users/delete/:id' =>'users#delete', as: :user_delete
  get 'users/:id' => 'users#show', as: :users_show
  delete 'users/:id' =>'users#destroy'

  get 'categories/new/:pid' => 'categories#new',as: :categories_new
  post 'categories' => 'categories#create'
  get 'categories/admin' => 'categories#index' ,as: :categories_admin

  get 'products/new' => 'products#new', as: :products_new
  post 'products' => 'products#create'
  get 'products/admin' => 'products#index', as: :products_admin
  get 'products/modify/:id' => 'products#modify', as: :products_modify
  post 'products/change' => 'products#change',as: :products_change
  get 'products/delete/:id' => 'products#delete', as: :products_delete
  delete 'products/:id' => 'products#destroy'


  get 'administrators/new' => 'administrators#new', as: :new_administrator
  get 'administrators/login' => 'administrators#login' ,as: :administrators_login
  get 'administrators/logout' => 'administrators#logout', as: :administrators_logout
  post 'administrators' => 'administrators#create'
  post 'administrators/authenticate' => 'administrators#authenticate', as: :administrators_authenticate

  get 'cart_items/add/:product_id' => 'cart_items#add', as: :cart_items_add
  post 'cart_items/add_to_cart' => 'cart_items#add_to_cart', as: :add_to_cart
  post 'cart_items/update_item' => 'cart_items#update_item', as: :update_item
  get 'cart_items/delete_item/:cart_item_id' => 'cart_items#delete_item', as: :delete_item

  get 'carts/show' => 'carts#show', as: :carts_show
  get 'carts/empty_cart' => 'carts#empty_cart', as: :empty_cart
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
