Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'pages#home'
    # this is the final and good code
    # resources :collections do
    #   resources :tags
    # end
    resources :collections do
      resources :reviews
    end

    resources :tag_collections, only: [:create]
    resources :tags
    resources :users
    resources :movies, only: [:show]
    resources :tag_collections, only: [:create]
    resources :friendships
    #post "search", to: "pages#search"
    # get "friends", to: "pages#friends"
    get "about", to: "pages#about"
    get "results", to: "pages#results"
    get "search", to: "pages#search"
    get "pending", to: "friendships#pending"
    get "sent", to: "friendships#sent"
    get "profile", to: "pages#profile"

     # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
    mount Sidekiq::Web => '/sidekiq' # warning everyone has access to this.. please consult the lecture notes ..lambda { |u| u.admin }
end

