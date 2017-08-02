Rails.application.routes.draw do
  resources :authorships
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
  resources :sections do
    resources :articles
  end

  resources :authorships
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
