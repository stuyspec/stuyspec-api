Rails.application.routes.draw do
  resources :subscribers
  resources :media
  resources :authorships
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
  resources :sections do
    resources :articles do
      resources :media
    end
  end
  resources :articles do
    resources :authorships
    resources :media
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
