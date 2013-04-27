@Ysawacom.module "NowLoadingApp", (NowLoadingApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = true

  API =
    show: ->
      NowLoadingApp.Show.Controller.show()
    hide: ->
      NowLoadingApp.Show.Controller.hide()

  App.commands.addHandler "show:now_loading", API.show
  App.commands.addHandler "hide:now_loading", API.hide
