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
      view.$el.find('.content > h2').prepend('<i class="icon-hand-right"></i> ')
      view.$el.find('.content a').each ->
        $el = $(@)
        href = $el.attr 'href'
        if href.match(/^http:\/\//)
          $el.attr 'target', '_blank'
