Embertest.Router.map ->
  @resource 'client', path: 'client/:client_id'

Embertest.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('clients').set('content', Embertest.Client.find())

Embertest.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('events').resetWithClientId(null)

Embertest.ClientRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('events').resetWithClientId(model.get('id'))

  renderTemplate: ->
    @_super()
    @render 'newMessage',
      into: 'application'
      outlet: 'messageOutlet'
      controller: @controllerFor('client')
