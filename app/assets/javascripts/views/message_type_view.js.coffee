Embertest.MessageTypeView = Ember.View.extend
  currentMessageTypeBinding: 'Embertest.filters.typeId'
  templateName: 'message_type'
  tagName: 'li'
  classNameBindings: 'isCurrentFilter:active'

  isCurrentFilter: (->
    @get('currentMessageType') == @get('content.id')
  ).property('currentMessageType')
