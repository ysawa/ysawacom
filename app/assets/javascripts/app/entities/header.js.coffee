@Ysawacom.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends Entities.Model

  class Entities.HeaderCollection extends Entities.Collection
    model: Entities.Header

  API =
    getMain: ->
      new Entities.HeaderCollection [
        { name: "Home", url: Routes.root_path(), active: false }
        { name: "Articles", url: Routes.articles_path(), active: false }
        { name: "Skills", url: '/about/skills', active: false }
      ]
    getSub: ->
      new Entities.HeaderCollection [
      ]

  App.reqres.addHandler "header:entities:main", ->
    API.getMain()

  App.reqres.addHandler "header:entities:sub", ->
    API.getSub()
