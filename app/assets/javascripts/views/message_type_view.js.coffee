Embertest.MessageTypeView = Ember.View.extend
  templateName: 'message_type'
  tagName: 'li'
  classNameBindings: 'isCurrentFilter:active'

  isCurrentFilter: (->
    @get('controller.currentMessageType') == @get('content.id')
  ).property('controller.currentMessageType')
