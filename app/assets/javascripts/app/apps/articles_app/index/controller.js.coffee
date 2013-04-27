@Ysawacom.module "ArticlesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  Index.Controller =

    index: ->
      view = @getArticlesView()
      App.mainRegion.show view

    getArticlesView: ->
      new Index.View
