WebsocketRails::EventMap.describe do

  subscribe :client_disconnected, 'web_sockets/authorization#client_disconnected'

  namespace :user do
    subscribe :get_channel_key, 'web_sockets/authorization#get_channel_key'
  end

  namespace :websocket_rails do
    subscribe :subscribe_private, 'web_sockets/authorization#authorize_user_channel'
  end

end