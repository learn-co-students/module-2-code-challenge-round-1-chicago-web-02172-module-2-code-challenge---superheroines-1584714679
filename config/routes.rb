Rails.application.routes.draw do
  resources :powers, only: [:index]
  resources :heroines, only: [:index]  

  get '/heroines/index', to: 'heroines#index'
  get '/powers/index', to: 'powers#index'
  get 'heroines/:id', to: 'heroines#show', as: "heroine"

end
