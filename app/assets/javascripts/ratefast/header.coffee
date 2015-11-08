window.RateFast ||= {}

class RateFast.Header
  @$headerTag = $('header.header')

  @setup: ->
    @bindEvents();

  @bindEvents: ->
    @$headerTag.on 'click', '.header__vote', =>
      @openCart()
      false

  @openCart: ->
    RateFast.VoteMenu.open()


