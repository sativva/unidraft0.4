Rails.application.routes.draw do
  mount Spree::Core::Engine, at: '/'
  mount Attachinary::Engine => "/attachinary"
  scope '(:locale)', locale: /en/ do

  get 'about', to: 'pages#about', as: 'about'
  get 'faq', to: 'pages#faq', as: 'faq'
  get 'you_are_designer', to: 'pages#you_are_designer', as: 'you_are_designer'
  post '/tinymce_assets' => 'tinymce_assets#create'
  get '/robots.:format' => 'pages#robots'
  root to: 'spree/home#index'
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  match "/422" => "errors#error422", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]
  match "/503" => "errors#error503", via: [ :get, :post, :patch, :delete ]
  Spree::Core::Engine.routes.append do
    resources :products do
      member do
        get 'vote2', to: "products#vote2"
        get 'unvote', to: "products#unvote"
        put "like", to: "products#upvote"
       # put "dislike", to: "links#downvote"

      end
    end

    resources 'drafts'
    resources :designers do
      member do
       put "follow", to: "designers#follow"
       # put "dislike", to: "links#downvote"
      end
    end
    namespace :admin do
      resources :designers, controller: "designers"
      get 'home', controller: "home"

    end
    # get 'auth/:provider/callback', to: 'sessions#create'
    # get 'auth/failure', to: redirect('/')
    # get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
    get 'message', to: 'messages#new'
    post 'message', to: 'messages#create'
  end
 end
end
