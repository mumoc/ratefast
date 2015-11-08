window.RateFast ||= {}

class RateFast.ScrollTo
  @scroll: (target) ->
    offset = $(target).offset().top
    $('html, body').animate({ scrollTop: offset }, 2000)
