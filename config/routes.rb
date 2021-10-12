Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bills, only: [:index, :show, :destroy] do
        post :create_receivable, on: :collection
        post :create_payable, on: :collection
        put 'update_receivable/:id',
            to: 'bills#update_receivable',
            on: :collection,
            as: :update_receivable
        put 'update_payable/:id',
            to: 'bills#update_payable',
            on: :collection,
            as: :update_payable
      end

      resources :installments
      resources :document_types
      resources :rateios, only: [:index ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
