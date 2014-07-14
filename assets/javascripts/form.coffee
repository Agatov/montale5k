$ ->

  $('.send-form').on 'click', ->

    username = $('input[name=name]')
    phone = $('input[name=phone]')
    email = $('input[name=email]')

    shake_fields = []

    if username.val() < 2
      shake_fields.push username

    if phone.val() < 5
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/orders.json',
    {
      'order[name]': username.val(),
      'order[phone]': phone.val(),
      'order[email]': email.val(),
    },
    (data) =>

    )

    show_thank_you()
    reachGoal 'new_order'
#    track 'New order', {name: username.val(), phone: phone.val(), email: email.val()}



window.show_thank_you = ->

  form_block = $('.modal-form')

  form_block.animate({opacity: 0}, 1000, ->
    form_block.hide()
    thank_you_block = $('.modal-thank')
    thank_you_block.show()
    thank_you_block.animate({opacity: 1}, 1000, ->
      $('input[type=text]').val('')
    )
  )


window.shake_field = (field) ->
  shake(field, i) for i in [1..10]


window.shake = (field, i) ->

  if i%2
    field.animate({width: '-=15'}, 100)
  else
    field.animate({width: '+=15'}, 100)


window.reachGoal = (goal) ->
  yaCounter25569155.reachGoal goal