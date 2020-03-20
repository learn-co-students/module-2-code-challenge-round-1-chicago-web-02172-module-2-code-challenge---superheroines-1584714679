Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :heroines, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :heroine_powers
end
