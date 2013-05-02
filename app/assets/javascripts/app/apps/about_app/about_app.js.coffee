@Ysawacom.module "AboutApp", (AboutApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  class AboutApp.Router extends Marionette.AppRouter
    appRoutes:
      "about/skills"  : "skills"

  API =
    skills: ->
      AboutApp.Pages.Controller.skills()

  App.addInitializer ->
    new AboutApp.Router
      controller: API
