Rails.application.routes.draw do
  constraints(subdomain: "api") do
    post "/graphql", to: "graphql#execute"
    resources :outquotes
    resources :sections
    resources :articles
    resources :profiles
    resources :subscribers
    resources :roles do
      resources :profiles
    end
    resources :comments
    resources :media
    resources :authorships
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :users do
      resources :comments
      resources :profiles
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

    get '/init', to: 'initial#index'
    #get '/', to: 'initial#welcome'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  constraints lambda { |request| request.subdomain == "www" or request.subdomain == "" } do
    get '/:section/:slug', to: 'client_app#index'
    get '/*all', to: 'client_app#index'
    get '/', to: 'client_app#index' 
  end

end
