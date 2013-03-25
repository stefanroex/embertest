Embertest.EventController = Ember.ObjectController.extend
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
