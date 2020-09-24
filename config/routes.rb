Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  
  namespace :api, constraints: { format: 'json' } do
    namespace :v0 do
      resources :pings, only: [:index]
    end

    namespace :v1 do
      resources :products, only: [:index]
      resources :orders, only: [:create, :update]
    end
  end
end