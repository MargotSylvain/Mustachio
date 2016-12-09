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
    resources :tags
    resources :movies, only: [:show]
    post "search", to: "pages#search"
end
