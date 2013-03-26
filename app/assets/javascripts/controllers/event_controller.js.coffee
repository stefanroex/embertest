Embertest.EventController = Ember.ObjectController.extend
  message: (->
    @get('content.message').htmlSafe()
  ).property('content.message')

  editEvent: ->
    @transaction = @get('store').transaction()
    @transaction.add(@get('content'))
    @set('isEditing', true)

  updateEvent: ->
    @transaction.commit()
    @transaction = null
    @set('isEditing', false)

  cancelEditing: ->
    if (@transaction)
      @transaction.rollback()
      @transaction = null
    @set('isEditing', false)
