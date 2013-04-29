@Ysawacom.module "ArticlesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: (id) ->
      App.request "article:entities:find", { id: id }, (article) =>

        @layout = @getLayoutView()

        App.mainRegion.show @layout

        @showArticleView(article)

    getLayoutView: ->
      new Show.Layout

    showArticleView: (article) ->
      view = new Show.Article(model: article)
      @layout.articleRegion.show view
