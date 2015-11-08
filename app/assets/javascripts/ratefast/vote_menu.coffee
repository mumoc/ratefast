window.RateFast ||= {}

class RateFast.VoteMenu
  @$voteMenuTag = $('aside.active-voting')

  @setup: ->
    @bindEvents()

  @open: ->
    @$voteMenuTag.addClass 'open'

  @close: ->
    @$voteMenuTag.removeClass 'open'

  @bindEvents: ->
    @$voteMenuTag.on 'click', =>
      @close()

