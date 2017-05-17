Rails.application.routes.draw do
  resources :stripclubs do
    resources :reviews, only: [:create]
  end

  get 'instructions', to: 'pages#home'
  root to: 'stripclubs#index'

  get "/reviews", to: "reviews#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
