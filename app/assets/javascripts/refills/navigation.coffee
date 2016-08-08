$(document).ready ->
  menuToggle = $('#js-mobile-menu').unbind()
  $('#js-navigation-menu').removeClass 'show'
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('#js-navigation-menu').slideToggle ->
      if $(this).is(':hidden')
        $(this).removeAttr 'style'
      return
    return
  return
