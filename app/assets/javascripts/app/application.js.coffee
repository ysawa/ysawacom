#= require json2
#= require i18n
#= require i18n/translations
#= require underscore
#= require backbone
#= require backbone.babysitter
#= require backbone.wreqr
#= require backbone.marionette
#= require backbone.paginator
#= require js-routes
#= require hamlcoffee
#= require_tree ./config
#= require_self
#= require ./lib/mongo_model
#= require_tree ./lib
#= require_tree ./entities
#= require_tree ./apps
#= require_directory .

@Ysawacom = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.rootRoute = Routes.root_path()

  App.on "initialize:before", (options) ->

  App.addRegions
    headerRegion: "#header-region"
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
    nowLoadingRegion: "#now-loading-region"

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("FooterApp").start()
    App.module("NowLoadingApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

  App
