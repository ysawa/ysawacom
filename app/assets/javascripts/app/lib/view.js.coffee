@Ysawacom.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    templateHelpers: ->

      formattedTime: (time) ->
        if _.isNumber time
          time = new Date(time * 1000)
        else if _.isDate time
          # do nothing
        else
          return
        year = time.getFullYear()
        month = time.getMonth() + 1
        day = time.getDate()
        hour = time.getHours()
        if hour <= 9
          hour = "0#{hour}"
        minute = time.getMinutes()
        if minute <= 9
          minute = "0#{minute}"
        "#{year}/#{month}/#{day} #{hour}:#{minute}"

      linkTo: (name, url, options = {}) ->
        _.defaults options,
          external: false

        url = "#" + url unless options.external

        delete(options.external)
        attributes = ''
        _.each options, (value, key) ->
          attributes += " #{key}=\"#{value}\""

        "<a href='#{url}'#{attributes}>#{@h(name)}</a>"

      h: (text) ->
        "#{text}".replace('&', '&amp;').replace('\'', '&#039;').replace('"', '&quot;').replace('<', '&lt;').replace('>', '&gt;')

      currentUser:
        null
        # App.request("get:current:user").toJSON()
