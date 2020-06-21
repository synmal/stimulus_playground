Rails.application.routes.draw do
  root 'homepage#index'

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
