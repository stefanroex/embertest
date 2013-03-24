Embertest.Router.map ->
  @resource 'client', path: 'client/:client_id'

Embertest.ApplicationRoute = Ember.Route.extend
  init: ->
    Embertest.filters = Embertest.Filters.create()
    Embertest.filters.on 'didChange', =>
      filters = Embertest.filters.toParams()
      @controllerFor('events').set('content', Embertest.Event.find(filters))

  setupController: (controller, model) ->
    @controllerFor('clients').set('content', Embertest.Client.find())

  events:
    filterType: (typeId) ->
      Embertest.filters.set('typeId', typeId)

Embertest.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    Embertest.filters.resetWithClientId(null)

Embertest.ClientRoute = Ember.Route.extend
  setupController: (controller, model) ->
    Embertest.filters.resetWithClientId(model.get('id'))

  renderTemplate: ->
    @_super()
    @render 'newMessage',
      into: 'application'
      outlet: 'messageOutlet'
      controller: @controllerFor('client')
