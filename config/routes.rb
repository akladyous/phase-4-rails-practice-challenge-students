Rails.application.routes.draw do
  resources :students, only: [:show, :destroy]
  resources :instructors, only: [:create, :show, :update, :destroy] do
    resources :students, only: [:create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
