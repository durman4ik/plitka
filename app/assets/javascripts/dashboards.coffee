$(document).on('ready page:load', ->
  current = $('.error-notification')
  unless current == null
    window.setTimeout(hide, 3000)
)

hide = ->
  $('.error-notification').fadeOut(300)
