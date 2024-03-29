# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = undefined 
set_positions = undefined

# grab the .card class, iterate through and then ++ through them
set_positions = ->
    $('.card').each (i) ->
      $(this).attr 'data-pos', i + 1
      return
    return


ready = -> 
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) -> 
    updated_order = [] 
    set_positions()
    $('.card').each (i) -> 
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort' 
      data: order: updated_order 
    return
  return

#when the page loads with document.ready, pass in the ready function
$(document).ready ready