App.Routers.Housekeeps = Backbone.Router.extend
  initialize: (options)->
    @collection = options.collection

  routes:
    '': 'index'

  index: ->
    view = new App.Views.Pages.Index(collection: @collection)
    $('.content').html(view.render().el)