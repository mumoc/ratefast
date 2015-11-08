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

  $('.item-droppable').droppable({
    drop: (event, ui) ->
      snapToMiddle(ui.draggable, $(@))
      $(@).droppable('option', 'disabled', true)
      createResult(ui.draggable.data('item-id')).done (data) ->
        $("<li data-result-id='#{data.result.id}'>#{data.item.title} <a rel='nofollow' data-method='delete' href='/admin/results/#{data.result.id}'>Delete</a></li>").appendTo('.results .scheduled-list')

    out: (event, ui) ->
      $(@).droppable('option', 'disabled', false)
  })

  $('.results ul').sortable({
    stop: (event, ui) ->
      results = {}

      $.map($(@).find('li'), (el) ->
        results[$(el).data('result-id')] = $(el).index()
      )

      updateResults(ui.item.data('result-id'), results)
  })

  updateResults = (resultID, indexes) ->
    $.ajax({
      url: "/admin/results/#{resultID}"
      method: 'PUT'
      data: {
        result: {
          days: indexes
        }
      }
    })

  createResult = (itemID) ->
    $.ajax({
      url: '/admin/results'
      method: 'POST'
      data: {
        result: {
          item_id: itemID
        }
      }
    })

  snapToMiddle = (dragger, target) ->
    topMove = target.position().top - dragger.data('position').top + (target.outerHeight(true) - dragger.outerHeight(true)) / 2
    leftMove= target.position().left - dragger.data('position').left + (target.outerWidth(true) - dragger.outerWidth(true)) / 2

    dragger.animate({
      top: topMove
      left: leftMove
    }, {
      duration: 400
    })
