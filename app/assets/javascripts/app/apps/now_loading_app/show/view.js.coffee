@Ysawacom.module "NowLoadingApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.View extends App.Views.ItemView
    template: "now_loading_app/show/templates/show"
