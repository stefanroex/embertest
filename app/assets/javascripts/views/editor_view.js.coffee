Embertest.EditorView = Ember.TextArea.extend

  didInsertElement: ->
    @$().wysihtml5
      "font-styles": false
      "events":
        "change": =>
            console.log "change"
            value = @$().val()
            @set('value', value)

  valueChanged: (->
    value = @get('value')
    iframes = @get('parentView').$().find('iframe').contents().find('.wysihtml5-editor')
    editorValue = iframes.html()
    iframes.html(value) if (!Ember.isEqual(value, editorValue))
  ).observes('value')
