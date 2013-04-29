@Ysawacom.module "ArticlesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "articles_app/show/templates/layout"

    regions:
      articleRegion: "#article-region"

  class Show.Article extends App.Views.ItemView
    template: "articles_app/show/templates/_article"

