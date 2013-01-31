class Shop.Routers.Orders extends Backbone.Router
  routes:
    "index"         : "index"

  index: ->
    view = new Shop.Views.OrdersIndex()
    $('#orders').html(view.render().el)     

  show: (id)->
    alert "Order #{id}"     
  
