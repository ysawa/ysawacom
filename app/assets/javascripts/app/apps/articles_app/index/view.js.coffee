@Ysawacom.module "ArticlesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.View extends App.Views.ItemView
    template: "articles_app/index/templates/index"
