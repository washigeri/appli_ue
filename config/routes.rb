Rails.application.routes.draw do
  devise_for :admins
  get 'set_year' => 'years#set_year', as: 'set_year'
  get '/admin' => 'admin#admin', as: 'admin'
  resources :years, only: :show
  namespace :admin do
    resources :years, except: :show
    resources :others, except: :show
    resources :lieus, except: :show, controller: 'others', type: 'Lieu'
    resources :genres, except: :show, controller: 'others', type: 'Genre'
    resources :semestres, except: :show
    resources :ues, except: :show
    resources :modules, as: :cours, :controller => 'cours', except: :show
  end
  get '/pages/*page' => 'pages#show', as: :page
  resources :modules, as: :cours, :controller => 'cours', only: [:index, :show]
  resources :ues, only: [:index, :show]
  resources :semestres, only: [:index, :show]
  root 'pages#show', page: "home"
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all



  #get '/*any' => 'errors#not_found', :via => :all
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
