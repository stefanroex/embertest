Embertest.Filters = Ember.Object.extend Ember.Evented,
  listener: null
  clientId: undefined
  search: null
  typeId: null

  resetWithClientId: (clientId) ->
    @setProperties(clientId: clientId, search: null, typeId: null)

  triggerChange: (->
    @trigger('didChange')
  ).observes('clientId', 'search', 'typeId')

  toParams: ->
    filters =
      client_id_eq: @get('clientId')
      type_id_eq: @get('typeId')
      message_cont: @get('search')

    for i of filters
      delete filters[i] unless filters[i]?

    filters
