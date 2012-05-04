Cow::Application.routes.draw do
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
  resources :home do
    collection do
      get 'print'
    end
  end
  resources :dentists do
    member do
      post   'add_specialty'
      post   'remove_specialty'
      post   'add_horary'
      delete 'remove_horary'
    end
  end
  resources :estimates do
    get :autocomplete_patient_name, :on => :collection
    get :autocomplete_procedure_name, :on => :collection
  end   
  resources :financial_accounts
  resources :patients
  resources :procedures
  resources :payments
  resources :schedules do
    member do
      put 'confirm'
      put 'cancel'
    end
    collection do
      get   'calendar'
    end
  end
  resources :specialties
  resources :users

  match 'sign_in'  => 'welcome#index', :as => 'sign_in'
  resource :session, :controller => 'sessions'
  
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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
