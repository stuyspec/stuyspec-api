Rails.application.routes.draw do
  resources :user_roles
  resources :roles do
    resources :user_roles
  end
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
