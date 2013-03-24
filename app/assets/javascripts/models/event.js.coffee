Embertest.Event = DS.Model.extend
  message: DS.attr('string')
  typeId: DS.attr('number')
  createdAt: DS.attr('date')
  client: DS.belongsTo('Embertest.Client')

  typeName: (->
    Embertest.MESSAGE_TYPES[@get('typeId')].name
  ).property('typeId')
