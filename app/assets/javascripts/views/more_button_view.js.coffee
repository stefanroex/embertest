Embertest.MoreButtonView = Ember.View.extend
  templateName: 'more_button'
  paginationBinding: 'Embertest.eventPagination'

  loadMore: ->
    @get('controller').send('loadMore', @get('pagination.page') + 1)

  showLoadMore: (->
    @get('pagination.total') > (@get('pagination.per_page') * @get('pagination.page'))
  ).property('pagination')
