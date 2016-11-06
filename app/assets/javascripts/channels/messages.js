App.messages = App.cable.subscriptions.create "MessagesChannel",
  collection: -> $("[data-channel='messages']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @collection().append(data.message) unless @userIsCurrentUser(data.message)

  userIsCurrentUser: (message) ->
    $(message).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentMessage: ->
    if messageId = @collection().data('message-id')
      @perform 'follow', message_id: messageId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'turbolinks:load', -> App.messages.followCurrentMessage()