#$(document).on('scroll', ->
#  if $(this).scrollTop() > 400
#    $('.header-m').addClass('showed')
#  else
#    $('.header-m').removeClass('showed')
#)
#
$(document).on('ready page:load', ->
  setInterval(blink, 800)
  setInterval(blink_off, 500)
)

blink = ->
  $('.blink').removeClass('hide').addClass("show")

blink_off = ->
  $('.blink').removeClass('show').addClass("hide")


