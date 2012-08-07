App.Views.Pages ||= {}
App.Views.Pages.Index = Backbone.View.extend
	render: ->
		view = JST['pages/index'](pages: @collection)
		$(this.el).html(view)
		return this