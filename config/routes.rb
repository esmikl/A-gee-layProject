Rails.application.routes.draw do
  devise_for :users
  get 'trash/view'

  get 'tags/index'

  get 'tags/show'

  get 'dashboard/show'
  get 'tags/:tag', to: 'tags#show'
  resources :notes
  resources :tags, only: [:index, :show]
  resources :notes do
    member do
      put 'share'
    end
  end
  
  resources :notes do
    member do
      put 'unshare'
    end
  end
  
  root to: 'home#about'
  
  get 'home/index'
  get '/dashboard' => 'dashboard#show'
  get 'shared_notes/:id' => 'shared_notes#show'
  
  post '/notes/process/' => 'notes#process_markdown'
  
  get '/trash' => 'trash#show'
  
  resources :trashed_notes, only: [:index, :update, :destroy]
  
  post '/trash' => 'trashed_notes#emptyTrash'
  
  resources :tags do
    get :autocomplete_tag_name, :on => :collection
  end
  
  get 'tags/list' => 'notes#list'

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
