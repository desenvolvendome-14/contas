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
      resources :reason_bearishes
      resources :rateios, only: [:index ]
      resources :payments do
        post :create_payable, on: :collection
        post :create_invoice_receivable, on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
