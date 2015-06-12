MonPatois::Application.routes.draw do  
  resources :discussions do
    get :delete, :on => :member
  end


  resources :comments do
    get :delete, :on => :member
  end


  get "votation/new"

  get "votation/create"

  resources :users do 
    member do
     get 'update_password'
     get 'reset_password'
     put 'update_password'
    end
    collection do
      get 'reset_password'
    end
  end  

  resources :translations

  resources :expressions do
    get :delete, :on => :member
  end
  


  resources :words

  get "/languages/load_dictionary", :to => "languages#load_dictionary"
  get "/languages/load_expressions", :to => "languages#load_expressions"
  get "/languages/load_discussions", :to => "languages#load_discussions"
  post "/languages/vote", :to => "languages#create_votation"

  resources :languages do
    get :delete, :on => :member
  end
  
  #get "load_dictionary", :to => "languages#load_dictionary"
  #get "load_expressions", :to => "languages#load_expressions"
  
  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#logout', via: [:get, :post]
  
  post "create_user", :to => "users#create"
  match "create_session", :to => "sessions#create_by_mail", via: [:get, :post]
  post 'reset_password', :to => 'users#reset_password'
  get "logout", :to => "sessions#logout"


  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
