App.offer = App.cable.subscriptions.create 'OfferChannel',
  connected: ->
    @follow()
    return

  disconnected: ->

  received: (data) ->
    @renderMessage(data)

  follow: ->
    @perform 'follow'
    $('body').removeClass('js-disable-events')
    return

  renderMessage: (data) ->
    container = $('#offers')
    old_message = container.find("#offerId#{data.id}")
    if old_message.length > 0
      old_message.replaceWith(data.message)
    else
      container.prepend(data.message)
      App.utils.successMessage('Offer added')
