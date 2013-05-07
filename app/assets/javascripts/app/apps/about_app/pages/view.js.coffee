@Ysawacom.module "AboutApp.Pages", (Pages, App, Backbone, Marionette, $, _) ->

  class Pages.Skills extends App.Views.ItemView
    template: "about_app/pages/templates/skills"

  class Pages.Works extends App.Views.ItemView
    template: "about_app/pages/templates/works"
