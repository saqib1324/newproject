Rails.application.routes.draw do
  # get 'letters/index'

  get 'students_home/index'
  get 'students_home/profile'
  root 'home#index'
  get 'students/import_sample'
  get 'students/delete_all' => 'students#delete_all'
  get 'students/view' => 'students#view'
  get 'students_home/password_reset'
  get 'voucher_mappings/bulk_download'
  get 'voucher_mappings/download_csv'
  get 'voucher_mappings/delete_all'
  get 'coaching_sessions/index'
  get 'undertakings/pending'
  get 'undertakings/upload'
  get 'undertakings/manage'
  get 'undertakings/accepted_view'
  get 'undertakings/downloaded_view'
  get "voucher_nos/update_it"
  get "activate_coaching_sessions" => "coaching_sessions#activate"
  get 'students/:id/view' => 'students#index'
  get 'letters/index'
  get 'students_home/profile'
  devise_for :users, controllers: { registrations: "registrations"}
  resources :coaching_sessions
  resources :letters
  resources :students_home
  resources :students do
    collection { post :import }
  end
  resources :voucher_mappings do
    collection { post :import }
  end
  resources :home
  resources :undertaking_texts
  resources :undertakings
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
    # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
