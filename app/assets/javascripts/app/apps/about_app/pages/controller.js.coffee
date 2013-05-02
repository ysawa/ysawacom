@Ysawacom.module "AboutApp.Pages", (Pages, App, Backbone, Marionette, $, _) ->

  Pages.Controller =

    skills: ->
      view = @getSkillsView()
      App.mainRegion.show view

    getSkillsView: ->
      new Pages.Skills
