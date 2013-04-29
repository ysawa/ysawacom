@Ysawacom.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Pager extends Backbone.Paginator.requestPager
    paginator_core:
      type: 'GET'
      dataType: 'json'
      url: ->
        @url

    paginator_ui:
      firstPage: 1
      currentPage: 1
      count: 0
      perPage: 10
      totalPages: 10
    server_api:
      page: ->
        @currentPage
    parse: (response) ->
      @.currentPage = response.page
      @.count = response.count
      @.perPage = response.per_page
      @.totalPages = response.total_pages

    toJSON: ->
      _.pick(@, 'count', 'currentPage', 'totalPages', 'firstPage', 'perPage')
