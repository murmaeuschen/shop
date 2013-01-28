class Shop.Models.User extends Backbone.Model

  #initialize: ->
    #@url = "/api/users/#{@get('id')}"

  url: ->
    if @id?
      "/api/users/#{@id}"
    else
      "/api/users"
