$(document).on('click', '.remove', ->
  current_item = $(this).parents('li.service')
  current_item.fadeOut(200, ->
    current_item.remove()
  )
)

$(document).on('click', '.service-add', ->
  $('.new-service-form').attr('data-state', 'showed')
)

$(document).on('click', '.advantage-add', ->
  $('.new-advantage-form').attr('data-state', 'showed')
)

$(document).on('click', '.close-link', ->
  $('.new-service-form, .new-advantage-form').attr('data-state', 'hidden')
)