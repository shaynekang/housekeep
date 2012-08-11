window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
  	pages = new App.Collections.Pages()
  	pages.fetch
  		success: ->
  			new App.Routers.Housekeeps(collection: pages)
  			Backbone.history.start()

# $(document).ready ->
#   App.init()
