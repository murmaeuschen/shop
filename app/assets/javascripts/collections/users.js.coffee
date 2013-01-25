class Shop.Collections.Users extends Backbone.Collection

  baseUrl: '/api/users'
  model: Shop.Models.User
  #currentPage: 1
  #perPage: 10
  initialize: (options) =>
    @init_pagination(options)

  pageInfo: =>
    info =
      numPages: @numPages
      currentPage: @currentPage
      perPage: @perPage
      numPages: @numPages
      prev: false
      next: false
      pageParam: "page"
  #pageParam: "page"

  parse: (resp) =>
    @init_pagination(resp)
    resp["models"]

  init_pagination: (options) =>
    @currentPage = options['current_page']
    @perPage = options['per_page']
    @numPages = options['num_pages']
    
  howManyPer: (newPerPage) =>
    @currentPage = 1
    @perPage = newPerPage
    return @fetch()
    
  nextPage: =>
    @currentPage = @currentPage + 1
    return @fetch()
 
  previousPage: =>
    @currentPage = @currentPage - 1
    return @fetch()

  gotoPage: (page) =>
    @currentPage = page
    return @fetch()

  url: =>
    @baseUrl + '?' + $.param({currentPage: @currentPage, perPage: @perPage})

  duplicateUser: (userId) ->
    curAttr = @get(userId).attributes
    dupl_user = new Shop.Models.User(curAttr)
    dupl_user.id = undefined
    dupl_user.attributes["id"] = undefined
    dupl_user  

 