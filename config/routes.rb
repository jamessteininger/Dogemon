Rails.application.routes.draw do
  resources :pvp_battles

  get 'home', to: 'static_pages#home'
  
  get 'index', to: 'static_pages#index', as: 'index'
  get 'about', to: 'static_pages#about'
  get 'how_to_play', to: 'static_pages#how_to_play'
  
  resources :equipment

  resources :market_item_votes

  resources :battle_logs

  resources :votable_items do
    get 'upvote'
    get 'downvote'
  end

  resources :aenemies
  get 'wallet', to: 'static_pages#wallet', as: 'wallet'

  resources :battles do
    get 'spawn_aenemy'
    get 'attack_enemy'
    resources :users
    resources :enemies
    resources :aenemies 
  end

  resources :enemies

  resources :pets do
    resources :item_insts
    resources :equipment
  end

  resources :logs

  resources :towns

  resources :colusseums
  root 'items#index'
  resources :sales
  
  get 'items/grid'
  resources :items do
    get 'upvote'
    member do
      post 'upvote'
    end
  end
  as :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users, skip: [:sessions]

  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, skip: [:sessions] do
    get 'set_town'
    members do
      get 'set_town'
      patch :edit, 'set_town'
    end
  end
resources :users do
  get 'add_coin'
  post 'set_town'
  get 'set_town'
  resources :item_insts
  resources :sales
end
resources :item_insts
resources :sales
resources :colusseums
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
