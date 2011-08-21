Sogoke::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => [:show] do
    get :inactive, :on => :collection
    resources :articles, :only => :index
    resource :favorites, :only => [] do
      get :products
      get :stores
      get :articles
    end
  end
    
  scope "/users" do
    resources :settings, :only => [] do
      collection do
        get :base
        get :binding

        put :base
        put :binding
      end
    end
  end
  
  resource :preference, :only => [:edit, :update]
  resources :stores, :only => [:show, :edit, :update] do
    resources :comments, :only => [:create, :destroy]
  end
  resources :products do
    resources :comments, :only => [:create, :destroy]
  end
  resources :articles, :except => :index do
    resources :comments, :only => [:create, :destroy]
  end
  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end
  
  resources :favorites, :only => [:create, :destroy]
  
  resources :invitations, :only => [:show, :new, :create] do
    collection do
      post :friends
      get :friends
    end
  end
  
  resources :messages, :except => [:update, :edit]
  
  # Admin here
  resources :categories
  resources :tags
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
  # match ':controller(/:action(/:id(.:format)))'
end
