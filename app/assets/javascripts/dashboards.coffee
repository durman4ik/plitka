$(document).on('ready page:load', =>
  @timeout = setTimeout(hide_notificatioin, 5000)
)

$(document).on('mouseover', '.error-notification', =>
  clearTimeout(@timeout)
).on('mouseleave  ', '.error-notification', =>
  @timeout = setTimeout(hide_notificatioin, 5000)
)

$(document).on('click', '.error-notification', =>
  $('.error-notification').hide(0)
)

hide_notificatioin = =>
  $('.error-notification').fadeOut(300)
