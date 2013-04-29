@Ysawacom.module "ArticlesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  Index.Controller =

    index: (page = 1) ->
      App.request "article:entities", { page: page }, (articles) =>

        @layout = @getLayoutView()

        @layout.on "show", =>
          @showPagination articles, page
          @showArticles articles, page

        App.mainRegion.show @layout

    showPagination: (articles, page) ->
      paginationView = @getPaginationView articles, page
      @layout.paginationRegion.show paginationView

    showArticles: (articles, page) ->
      articlesView = @getArticlesView articles, page
      @layout.articlesRegion.show articlesView

    getArticlesView: (articles, page) ->
      new Index.Articles
        collection: articles

    getPaginationView: (articles, page) ->
      new Index.Pagination
        model: articles

    getLayoutView: ->
      new Index.Layout
