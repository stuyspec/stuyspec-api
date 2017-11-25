Rails.application.routes.draw do
  resources :outquotes
  resources :sections
  resources :newspapers
  resources :articles
  resources :user_roles
  resources :subscribers
  resources :roles do
    resources :user_roles
  end
  resources :comments
  resources :media
  resources :authorships
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users do
      resources :comments
    resources :user_roles
  end
  resources :sections do
    resources :articles do
      resources :media
    end
  end
  resources :articles do
    resources :outquotes
    resources :authorships
    resources :media
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
