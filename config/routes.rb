Rails.application.routes.draw do
  resource :user, only: [:show, :destroy]
  match "auth/:provider/callback", to: "users#callback", via: [:get, :post]

  root 'welcome#index'
end
