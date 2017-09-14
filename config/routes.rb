Rails.application.routes.draw do
  resources :newspapers do
    resources :articles
  end
  resources :user_roles
  resources :roles
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
    resources :user_roles
  end
  resources :sections
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
