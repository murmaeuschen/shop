class Shop.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  events:
    'click #user_create_button': 'createUser'
    'click #backward': 'previous'
    'click #forward': 'previous'
    'click #first': 'previous'
    'click #last': 'previous'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)
    console.log @collection.pageInfo
            
  render: ->
    $(@el).html(@template(users: @collection))
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
    @collection.gotoPage(@collection.pageInfo.numPages)
    return false

  first: =>
    @collection.gotoPage(1)
    return false



  changeShownNum: ->
    console.log @collection.pageInfo.perPage
    @collection.howManyPer(25) if @collection.pageInfo.perPage = 10
    @collection.howManyPer(10) if @collection.pageInfo.perPage = 25
    @render
    console.log @collection.pageInfo.perPage
