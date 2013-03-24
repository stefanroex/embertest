Embertest.EventsController = Ember.ArrayController.extend
  sortProperties: ['id']
  sortAscending: false

  addEvent: (message, typeId, client) ->
    newEvent = Embertest.Event.createRecord
      message: message
      typeId: typeId
      client: client
    @get('content').addObject(newEvent)
    @store.commit()

  deleteEvent: (event)->
    @get('content').removeObject(event)
    event.deleteRecord()
    @store.commit()

  loadMore: (page) ->
    query = $.extend(@get('content').query, {page: page})
    Embertest.Event.find(query).then (result) =>
      @get('content').addObjects(result)
