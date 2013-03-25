Embertest.ApplicationController = Ember.Controller.extend
  needs: 'events'
  currentMessageTypeBinding: 'controllers.events.typeId'
  searchBinding: 'controllers.events.search'
  messageTypesBinding: "Embertest.MESSAGE_TYPES"
