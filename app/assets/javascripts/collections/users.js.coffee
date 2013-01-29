class Shop.Collections.Users extends Backbone.Collection

  baseUrl: '/api/users'
  model: Shop.Models.User

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
      orderBy: @orderBy
      pageParam: "page"
  
  parse: (resp) =>
    @init_pagination(resp)
    resp["models"]

  init_pagination: (options) =>
    @currentPage = options['current_page']
    @perPage = options['per_page']
    @numPages = options['num_pages']
    @orderBy = options['order_by']

  howManyPer: (newPerPage) =>
    @currentPage = 1
    @perPage = newPerPage
    @fetch()

  sortTable: (ident) =>
    if @orderBy.match /ASC/i
      @orderBy = "#{ident} DESC"
    else
      @orderBy = "#{ident} ASC"
    console.log @orderBy
    @fetch()
        
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
    @baseUrl + '?' + $.param({orderBy: @orderBy, currentPage: @currentPage, perPage: @perPage}) #?filter=true&field=login_name&method=start_with&query=k

  duplicateUser: (userId) ->
    curAttr = @get(userId).attributes
    dupl_user = new Shop.Models.User(curAttr)
    dupl_user.id = undefined
    dupl_user.attributes["id"] = undefined
    dupl_user   