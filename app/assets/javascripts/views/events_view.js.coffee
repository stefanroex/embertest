Embertest.EventsView = Ember.View.extend
  showName: (->
    not @get('controller.content').query.client_id_eq?
  ).property('controller.content')
