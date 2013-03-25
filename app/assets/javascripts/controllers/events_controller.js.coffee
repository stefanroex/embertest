Embertest.EventsController = Ember.ArrayController.extend
  sortProperties: ['id']
  sortAscending: false
  clientId: undefined
  search: undefined
  typeId: undefined

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

  resetWithClientId: (clientId) ->
    @setProperties(clientId: clientId, search: null, typeId: null)

  triggerChange: (->
    filters =
      client_id_eq: @get('clientId')
      type_id_eq: @get('typeId')
      message_cont: @get('search')

    for i of filters
      delete filters[i] unless filters[i]?

    @set('content', Embertest.Event.find(filters))
  ).observes('clientId', 'search', 'typeId')
