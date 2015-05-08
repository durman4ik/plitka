$(document).on('click', '.remove', ->
  current_item = $(this).parents('li.service')
  current_item.fadeOut(200, ->
    current_item.remove()
  )
)

$(document).on('click', '.link-add', ->
  $('.new-service-form').attr('data-state', 'showed')
)

$(document).on('click', '.close-link', ->
  $('.new-service-form').attr('data-state', 'hidden')
)