Rails.application.routes.draw do
  resources :todos, except: [:edit, :update]
end
