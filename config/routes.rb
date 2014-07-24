Rails.application.routes.draw do
  
  scope '(:locale)' do
    get 'works/index'
    get 'works' => 'works#index'
    get 'home/index'
  end

  # json interfaces
  get 'hostname.:format' => 'api#hostname', format: :json
  get 'uname.:format' => 'api#uname', format: :json
  get 'uptime.:format' => 'api#uptime', format: :json
  get 'free_spaces.:format' => 'api#free_spaces', format: :json
  get 'memory_split.:format' => 'api#memory_split', format: :json
  get 'free_memory.:format' => 'api#free_memory', format: :json
  get 'cpu_temperature.:format' => 'api#cpu_temperature', format: :json
  get 'cpu_info.:format' => 'api#cpu_info', format: :json

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index', as: 'home'

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
