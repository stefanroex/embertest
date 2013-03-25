Embertest.EventView = Ember.View.extend
  renderEditor: (->
    alert 'test'
    @$("textarea").wysihtml5()
  ).observes('content.isEditing')
