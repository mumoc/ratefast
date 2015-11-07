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
