class Shop.Views.OrdersIndex extends Backbone.View

  template: JST['orders/index']

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)
    #@trigger 'click #search', @collection.filterTable 'login_name', 'start_with', ''

  render: ->
    $(@el).html(@template())    
    #$('#orders').html(@template())    
    @
