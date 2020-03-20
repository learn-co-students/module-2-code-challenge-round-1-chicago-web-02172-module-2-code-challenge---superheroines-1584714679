Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :edit, :update]
  resources :heroines, only: [:index, :new, :create, :show]  
end
