Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  resources :messages

  resources :comments

  resources :notifications

  resources :doge_elements

  resources :bounties

  resources :friendships
  resources :doge_elements

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  #mount Forem::Engine, :at => '/forums'
  resources :posts

  resources :blogs

  resources :ghost_logs do
    get 'destroyall'
  end

  resources :ghosts 


  resources :guilds do
    get 'move_guild'
    collection do
      get :user
    end
    resources :users do
      collection do
        get :pet
      end
      resources :pets do
        resources :battles
      end
    end
  end

  resources :wallpapers

  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  resources :pvp_battles do
    get 'apply_regen'
    post 'set_pet2'
    get 'restore_health'
  end

  root 'static_pages#home'

  get 'home', to: 'static_pages#home'
  get 'roadmap', to: 'static_pages#roadmap'
  get 'leaderboard', to: 'static_pages#leaderboard'
  get 'full_game', to: 'static_pages#full_game'
  get 'vr_game', to: 'static_pages#vr_game'

  get 'index', to: 'static_pages#index', as: 'index'
  get 'about', to: 'static_pages#about'
  get 'how_to_play', to: 'static_pages#how_to_play'
  get 'legal', to: 'static_pages#legal', as: 'legal'
  get 'dogecoin_intro', to: 'static_pages#dogecoin_intro', as: 'dogecoin_intro'

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
    get 'ghost_attack'
    get 'attack_enemy'
    resources :users
    resources :enemies
    resources :aenemies 
  end

  resources :enemies
  resources :feedbacks

  resources :pets do
    resources :item_insts
    get 'challenge'
    resources :equipment
  end

  resources :logs

  resources :towns

  resources :colusseums
  resources :sales

  get 'items/grid'
  resources :items do
    get 'upvote'
    get 'mod_block'
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
    get 'sell_all'
    get 'add_coin'
    get 'make_wallet'
    get 'remove_battle_logs'
    get 'mod'
    post 'send_doge'
    get 'get_booster'
    get 'join_guild'
    resources :transactions
    post 'set_town'
    get 'set_town'
    get 'give_doge'
    resources :pvp_battles
    resources :item_insts
    resources :sales
  end
  resources :item_insts
  resources :sales
  resources :colusseums

  mount ActionCable.server => '/cable'
end
