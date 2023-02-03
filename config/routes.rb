Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'user/omniauth_callbacks'}
  # authentification google
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/indexprincipal", to: "pages#indexprincipal"

  resources :vinyls
  get "archives", to: "vinyls#archives"

  resources :favorites, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
