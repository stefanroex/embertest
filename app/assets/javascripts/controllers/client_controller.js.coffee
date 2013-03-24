Embertest.ClientController = Ember.ObjectController.extend
  needs: ['events']

  addMessage: (message, typeId) ->
    @get('controllers.events').addEvent(message, typeId, @content)
