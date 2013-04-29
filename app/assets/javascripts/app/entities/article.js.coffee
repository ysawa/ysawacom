@Ysawacom.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Article extends Entities.Model
    urlRoot: Routes.articles_path
    url: ->
      if _.isFunction @urlRoot
        base = @urlRoot()
      else
        base = @urlRoot
      if @id
        base + '/' + @id
      else
        base
    parse: (response, options) ->
      if typeof response.article == 'undefined'
        @attributes = _.extend(@attributes, response)
      else
        @attributes = _.extend(@attributes, response.article)

  class Entities.ArticlesPager extends Entities.Pager
    model: Entities.Article
    url: -> Routes.articles_path()
    parse: (response) ->
      results = response.articles
      results

  API =
    getArticleEntities: (options = {}, callback = null) ->
      articles = new Entities.ArticlesPager
      if options.page
        articles.paginator_ui.currentPage = options.page
      articles.fetch
        success: ->
          if callback
            callback articles
    getArticleEntity: (options = {}, callback = null) ->
      article = new Entities.Article(_id: options['id'])
      article.fetch
        success: (article, response, options) ->
          console.log article, response
          if callback
            callback article

  App.reqres.addHandler "article:entities", (options = {}, callback = null) ->
    API.getArticleEntities options, callback

  App.reqres.addHandler "article:entities:find", (options = {}, callback = null) ->
    API.getArticleEntity options, callback
