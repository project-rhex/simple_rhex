# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

set_up_authorize_user = ->
  $('#new_authorized_user').bind("ajax:success", (evt, data, status, xhr) ->
    $('#addUser').modal('hide')
    $('#authorized-users').html(data)
  ).bind("ajax:error", (evt, data, status, xhr) ->
    $('#addUser').modal('hide')
    error = $.parseJSON(data.responseText)
    $('#authorizedUserMessages').html("Email #{error.email}")
    $('#authorizedUserMessages').addClass('alert alert-error').fadeIn()
  )

$(set_up_authorize_user)