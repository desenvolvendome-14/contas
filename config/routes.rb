Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bills, only: [:index, :show, :destroy] do
        post :create_receivable, on: :collection
        post :create_payable, on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
