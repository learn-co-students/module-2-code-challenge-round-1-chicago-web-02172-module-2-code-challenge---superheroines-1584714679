Rails.application.routes.draw do
  resources :powers, except: [:delete]
  resources :heroines, except: [:delete]
end
