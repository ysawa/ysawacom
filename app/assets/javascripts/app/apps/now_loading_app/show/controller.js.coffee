@Ysawacom.module "NowLoadingApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    hide: ->
      if @view
        @view.$el.hide()

    modifyPosition: ->
      windowWidth = $(window).width()
      windowHeight = $(window).height()
      $img = @view.$el.find('img')
      imgWidth = $img.width()
      imgHeight = $img.height()
      $img.css(
        left: (windowWidth - imgWidth) / 2
        top: (windowHeight - imgHeight) / 2
      )

    show: ->
      unless @view
        @view = @getView()
        App.nowLoadingRegion.show @view
      @modifyPosition()
      @view.$el.show()

    getView: ->
      new Show.View
