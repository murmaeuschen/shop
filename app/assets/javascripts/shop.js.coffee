window.Shop =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Shop.Routers.Users()
    new Shop.Routers.Orders()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Shop.init()
  