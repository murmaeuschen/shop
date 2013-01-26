class Shop.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  events:
    'click #user_create_button': 'createUser'
    'click #backward'          : 'previous'
    'click #forward'           : 'next'
    'click #first'             : 'first'
    'click #last'              : 'last'
    'click .paging a'          : 'changeShownNum'
    #'click .setTen'            : 'changeToTen'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)
    
            
  render: ->
    $(@el).html(@template(users: @collection, pageInfo: @collection.pageInfo() ))
    @collection.each(@appendUser)
    @

  appendUser: (user) =>
    view = new Shop.Views.UsersUser(model: user)
    @$('tbody').append(view.render().el)

  createUser: ->
    Backbone.history.navigate("/new", true)

  previous: =>
    @collection.previousPage()
    return false
 
  next: =>
    @collection.nextPage()
    return false

  last: =>
    @collection.gotoPage(@collection.pageInfo().numPages)
    return false

  first: =>
    @collection.gotoPage(1)
    return false

  changeShownNum: (e) ->
    e.preventDefault()
    per = $(e.target).text().substring(5,7)
    @collection.howManyPer(per)
    @render
 