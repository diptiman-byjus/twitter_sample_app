Rails.application.routes.draw do

  if Rails.env.development? || Rails.env.staging?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  
  get 'group/index'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'

   #get 'static_pages/home'



   # get 'static_pages/help'
   # get 'static_pages/about'
   # get 'static_pages/contact'

   get 'help'    => 'static_pages#help'
   get 'about'   => 'static_pages#about'
   get 'contact' => 'static_pages#contact'
   get 'signup'  => 'users#new'

    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'

    get 'group' => 'users#group'


    resources :users do
      member do
        get :following, :followers
        post :adduserstothegrp
      end
    end
   resources :account_activations, only: [:edit]
   resources :password_resets,     only: [:new, :create, :edit, :update]
   resources :microposts,          only: [:create, :destroy]
   resources :relationships,       only: [:create, :destroy]

   
end
