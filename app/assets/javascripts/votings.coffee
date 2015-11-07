$ ->
  $('.btn-change-status').on 'click', ->
    $target  = $(@)
    event    = $target.data('event')
    votingID = $target.data('voting-id')

    $.ajax({
      url: "/admin/votings/#{votingID}"
      method: 'PUT'
      data: {
        voting: {
          event: event
        }
      }
    }).done((data) ->
      $target.text(data.btn_text)
      $target.data('event', data.next_status)
      $target.parents('tr').children('.voting-status').text(data.status)
    )

  $('.btn-vote').on 'click', ->
    $target  = $(@)
    vote     = $target.data('vote')
    itemID   = $target.data('item-id')

    $.ajax({
      url: "/items/#{itemID}"
      method: 'PUT'
      data: {
        item: {
          vote: vote
        }
      }
    }).done((data) ->
      $target.attr('disabled', 'disabled')
      $target.siblings('.btn-vote').removeAttr('disabled')
    )
