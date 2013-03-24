Embertest.CustomRESTSerializer = DS.RESTSerializer.extend
  extractMeta: (loader, type, json) ->
    meta = json[@configOption(type, 'meta')]
    if (meta)
      Embertest.set('eventPagination', meta)
    @_super(loader, type, json)

Embertest.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create
    bulkCommit: false
    serializer: Embertest.CustomRESTSerializer
