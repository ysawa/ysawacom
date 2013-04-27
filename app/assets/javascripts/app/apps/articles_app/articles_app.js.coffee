@Ysawacom.module "ArticlesApp", (ArticlesApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class ArticlesApp.Router extends Marionette.AppRouter
    appRoutes:
      "articles"  : "index"
      "articles/:id"  : "show"

  API =
    index: ->
      ArticlesApp.Index.Controller.index()
    show: (id) ->
      ArticlesApp.Show.Controller.show(id)

  App.addInitializer ->
    new ArticlesApp.Router
      controller: API
