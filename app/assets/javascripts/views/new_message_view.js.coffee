Embertest.NewMessageView = Ember.View.extend
  messageTypesBinding: 'Embertest.MESSAGE_TYPES'
  templateName: 'new_message'
  tagName: 'form'

  submit: ->
    if @get('message')
      @get('controller').addMessage(@get('message'), @get('typeId').id)
      @set('message', "")
    else
      alert "Message empty!"
    false

  selectableMessageTypes: (->
    @get('messageTypes').slice(1, 100)
  ).property('messageTypes')

  didInsertElement: ->
    # @$("textarea").wysihtml5()
