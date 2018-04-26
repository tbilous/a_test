# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', '#new_offer', (event) ->
  [data, status, xhr] = event.detail
  data = event.detail[0]
  document.getElementById("new_offer").reset();

$(document).on 'ajax:error', '#new_offer', (event) ->
  [data, status, xhr] = event.detail
  data = event.detail[0]
  App.utils.errorMessage(data)

$(document).on 'ajax:error', '.js-form-edit', (event) ->
  [data, status, xhr] = event.detail
  data = event.detail[0]
  App.utils.errorMessage(data)

$('#offers').on 'ajax:success', '.js-offer-common-edit', (event) ->
  [data, status, xhr] = event.detail
  data = event.detail[0]
  status = event.detail[1]
  xhr = event.detail[2]
  container = $(@).data('target')
  $(container).html(data)

$(document).on 'ajax:error', '.js-offer-common-edit', (event) ->
  [data, status, xhr] = event.detail
  data = event.detail[0]
  status = event.detail[1]
  xhr = event.detail[2]
  App.utils.errorMessage(data)
