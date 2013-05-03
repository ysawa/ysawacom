@Ysawacom.module "AboutApp.Pages", (Pages, App, Backbone, Marionette, $, _) ->

  Pages.Controller =

    skills: ->
      view = @getSkillsView()
      App.mainRegion.show view
      @drawLanguageSkills()

    drawLanguageSkills: ->
      data = [
        ['Ruby', 7]
        ['JavaScript', 7]
        ['PHP', 5]
        ['Japanese', 5]
        ['English', 3]
        ['Java', 3]
        ['Scheme', 3]
        ['C/C++', 2]
        ['D', 2]
      ]
      languages = _.collect(data, (datum) -> datum[0])
      options =
        xaxis:
          mode: "categories"
          categories: languages
        yaxis:
          max: 10
        series:
          color: 4
          bars:
            show: true
            barWidth: 0.6
            align: 'center'
        grid:
          backgroundColor:
            colors: ["#f5f5f5", "#d3d3d3"]
      $.plot('#language_skills', [data], options)

    getSkillsView: ->
      new Pages.Skills
