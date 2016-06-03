Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/customers", to: "customers#index"
      get "/customers/find_all", to: "customers/finder#index"
      get "/customers/find", to: "customers/finder#show"
      get "/customers/random", to: "customers/random#show"
      get "/customers/:id/favorite_merchant", to: "merchants/customer_favorite_merchant#show"
      get "/customers/:id", to: "customers#show"

      get "/invoices", to: "invoices#index"
      get "/invoices/find_all", to: "invoices/finder#index"
      get "/invoices/find", to: "invoices/finder#show"
      get "/invoices/random", to: "invoices/random#show"
      get "/invoices/:id", to: "invoices#show"

      get "/items", to: "items#index"
      get "/items/find", to: "items/finder#show"
      get "/items/find_all", to: "items/finder#index"
      get "/items/random", to: "items/random#show"
      get "/items/most_revenue", to: "items/item_most_revenue#index"
      get "/items/most_items", to: "items/item_most_items#index"
      get "/items/:id", to: "items#show"

      get "/transactions", to: "transactions#index"
      get "/transactions/find", to: "transactions/finder#show"
      get "/transactions/find_all", to: "transactions/finder#index"
      get "/transactions/random", to: "transactions/random#show"
      get "/transactions/:id", to: "transactions#show"

      get "/merchants", to: "merchants#index"
      get "/merchants/find", to: "merchants/finder#show"
      get "/merchants/find_all", to: "merchants/finder#index"
      get "/merchants/random", to: "merchants/random#show"
      get "/merchants/:id/items", to: "merchants/merchant_items#index"
      get "/merchants/:id/invoices", to: "merchants/merchant_invoices#index"
      get "/merchants/most_revenue", to: "merchants/merchant_revenue#index"      
      get "/merchants/:id/revenue", to: "merchants/merchant_revenue#show"
      get "/merchants/revenue", to: "merchants/merchant_date_revenue#show"
      get "/merchants/:id", to: "merchants#show"

      get "/invoice_items", to: "invoice_items#index"
      get "/invoice_items/find", to: "invoice_items/finder#show"
      get "/invoice_items/find_all", to: "invoice_items/finder#index"
      get "/invoice_items/random", to: "invoice_items/random#show"
      get "/invoice_items/:id", to: "invoice_items#show"

      get "/:class/:id/:objects", to: "relationships#index"
    end
  end
end
