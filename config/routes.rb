Rails.application.routes.draw do
  resources :subscribers
  resources :comments do
    resources :replies
  end
  resources :replies
  resources :media
  resources :authorships
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users do
    resources :replies
    resources :comments
  end
  resources :sections do
    resources :articles do
      resources :media
    end
  end
  resources :articles do
    resources :authorships
    resources :media
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
