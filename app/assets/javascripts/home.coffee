$(document).on('scroll', ->
  if $(this).scrollTop() > 130
    $('.header-m').addClass('showed')
  else
    $('.header-m').removeClass('showed')
)

$(document).on('ready page:load', ->
  if $('.blink')
    setInterval(blink, 800)
    setInterval(blink_off, 500)

  $('a.animation').click (event) ->
    event.preventDefault()
    if $(".articles.animated.bounceInUp") or $(".albums.animated.bounceInUp")
      $(".articles.animated.bounceInUp, .albums.animated.bounceInUp").removeClass('bounceInUp').addClass('bounceOutDown')
    if $(".yield.animated.bounceInLeft") or $(".yield.animated.bounceInLeft")
      $(".yield.animated.bounceInLeft, .yield.animated.bounceInLeft").removeClass('bounceInLeft').addClass('bounceOutLeft')
    if $(".hero-flip.animated.bounceInLeft")
      $(".hero-flip.animated.bounceInLeft").removeClass('bounceInLeft').addClass('bounceOutLeft')
    if $(".about-info")
      $(".about-info").addClass('animated bounceOutRight')
    if $(".about-second")
      $(".services.animated.bounceIn").removeClass('bounceIn').addClass('bounceOut')
    if $(".hero")
      $(".hero").addClass('animated tada')
    if $(".call-us")
      $(".call-us").addClass('bounceOutLeft')
    if $(".write-us")
      $(".write-us").addClass('animated bounceOutRight')
    if $(".show-portfolio")
      $(".connected-carousels .navigation").addClass('animated bounceOutLeft')
      $(".stage.fade-in.item-1").removeClass('fade-in item-4').addClass('animated bounceOutRight')
      $(".album-title").removeClass('bounceInLeft').addClass('bounceOutLeft')
    delay 800, -> redirect(event)
)

delay = (ms, func) -> setTimeout func, ms

redirect = (event)->
  window.location = event.currentTarget.href

blink = ->
  $('.blink').removeClass('hide').addClass("show")

blink_off = ->
  $('.blink').removeClass('show').addClass("hide")