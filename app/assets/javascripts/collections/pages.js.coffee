App.Collections.Pages = Backbone.Collection.extend
  url: '/pages'

  groupByTransactedAt: ->
    @groupBy (model) ->
      date = new Date(model.get('transacted_at'));
      year = date.getFullYear();
      month = date.getMonth()+1;
      date = date.getDate();

      "#{year}.#{month}.#{date}"

  total: ->
    @reduce((sum, num) ->
      sum + parseInt(num.get('amount'), 10)
    , 0)