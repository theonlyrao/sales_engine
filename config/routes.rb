Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/customers", to: "customers#index"
      get "/customers/find_all", to: "customers#find_all"
      get "/customers/find", to: "customers#find"
      get "/customers/random", to: "customers#random"
      get "/customers/:id", to: "customers#show"

      get "/invoices", to: "invoices#index"
      get "/invoices/find_all", to: "invoices#find_all"
      get "/invoices/find", to: "invoices#find"
      get "/invoices/random", to: "invoices#random"
      get "/invoices/:id", to: "invoices#show"

      get "/items", to: "items#index"
      get "/items/find", to: "items/finder#show"
      get "/items/find_all", to: "items/finder#index"
      get "/items/random", to: "items/random#show"
      get "/items/:id", to: "items#show"

      get "/transactions", to: "transactions#index"
      get "/transactions/find", to: "transactions/finder#show"
      get "/transactions/find_all", to: "transactions/finder#index"
      get "/transactions/random", to: "transactions/random#show"
      get "/transactions/:id", to: "transactions#show"
    end
  end
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
