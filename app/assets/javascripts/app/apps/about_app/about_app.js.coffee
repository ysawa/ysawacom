@Ysawacom.module "AboutApp", (AboutApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class AboutApp.Router extends Marionette.AppRouter
    appRoutes:
      "about/skills"  : "skills"
      "about/works"  : "works"

  API =
    skills: ->
      AboutApp.Pages.Controller.skills()
    works: ->
      AboutApp.Pages.Controller.works()

  App.addInitializer ->
    new AboutApp.Router
      controller: API
