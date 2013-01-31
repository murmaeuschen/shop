class Shop.Collections.Orders extends Backbone.Collection

  url: '/api/orders'
  model: Shop.Models.Order
