$ ->


  $('#show-form').on 'click', ->
    show_form()




window.show_form = ->
  $('.overlay').show()
  $('.modal').show()

  $('.overlay').on 'click', ->
    hide_form()


window.hide_form = ->
  $('.modal').hide()
  $('.overlay').hide()

  $('.overlay').unbind 'click'