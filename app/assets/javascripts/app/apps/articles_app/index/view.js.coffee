@Ysawacom.module "ArticlesApp.Index", (Index, App, Backbone, Marionette, $, _) ->

  class Index.View extends App.Views.ItemView
    template: "articles_app/index/templates/index"

  class Index.Layout extends App.Views.Layout
    template: "articles_app/index/templates/layout"

    regions:
      paginationRegion: "#articles-pagination-region"
      articlesRegion: "#articles-region"

  class Index.Pagination extends App.Views.ItemView
    template: "articles_app/index/templates/_pagination"

  class Index.Article extends App.Views.ItemView
    template: "articles_app/index/templates/_article"
    tagName: "tr"

  class Index.Empty extends App.Views.ItemView
    template: "articles_app/index/templates/_empty"
    tagName: "tr"

  class Index.Articles extends App.Views.CompositeView
    template: "articles_app/index/templates/_articles"
    itemView: Index.Article
    emptyView: Index.Empty
    itemViewContainer: "tbody"
