$ ->
  $('.item-draggable').draggable({
    revert: (event, ui) ->
      $(@).data("uiDraggable").originalPosition = {
        top: 0
        left: 0
      }

      return !event

    create: ->
      $(@).data('position', $(@).position())
  })

  $('.day-droppable').droppable({
    drop: (event, ui) ->
      snapToMiddle(ui.draggable, $(@))
      updateResult(ui.draggable.data('item-id'), $(@).data('scheduled'))
  })

  updateResult = (itemID, scheduled) ->
    $.ajax({
      url: "/admin/results/#{itemID}"
      method: 'PUT'
      data: {
        day: scheduled
      }
      done: ->
        debugger
    })

  snapToMiddle = (dragger, target) ->
    topMove = target.position().top - dragger.data('position').top + (target.outerHeight(true) - dragger.outerHeight(true)) / 2
    leftMove= target.position().left - dragger.data('position').left + (target.outerWidth(true) - dragger.outerWidth(true)) / 2

    dragger.animate({
      top: topMove
      left: leftMove
    }, {
      duration: 600
    })
