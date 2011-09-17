Pacific::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  root :to => "website#index"
  
  # Admin routes   
  match 'admin' => 'admin/main#index', :as => "admin"
  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    #resources :products
    resources :user_sessions
    resources :users # give us our some normal resource routes for users resource :user, :as => 'account' # a convenience route match 'signup' => 'users#new', :as => :signup
    resources :customers
    resources :sellers
    resources :movements
    resources :trades
    match '/movements/search' => "movements#search"
    match '/login' => "user_sessions#new", :as => "login"
    match '/logout' => "user_sessions#destroy", :as => "logout"
    match '/dashboard' => "dashboard#show", :as => "dashboard"
    resource :user, :as => 'account' # a convenience route 
    match 'signup' => 'users#new', :as => :signup
    #login 'login', :controller => "sessions", :action => "new"
    #logout 'logout', :controller => "sessions", :action => "destroy"
    #dashboard 'dashboard', :controller => "dashboard", :action => "show"
  end
end
