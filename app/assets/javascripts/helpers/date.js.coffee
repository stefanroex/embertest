Handlebars.registerHelper 'dateFormat', (context, block) ->
  moment(Date(context)).format('LL')
