Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :collections do
      resources :tags
    end
    # may need to add routes for tag
    resources :movies, only: [:index, :show, :new, :create]
end
