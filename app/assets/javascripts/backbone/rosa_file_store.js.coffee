#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.RosaFileStore =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  config:
    apiPrefix: '/api/v1/'
  init: ->
    new RosaFileStore.Routers.FileStoresRouter({file_stores: []})
    Backbone.history.start()

$(document).ready ->
  RosaFileStore.init()
