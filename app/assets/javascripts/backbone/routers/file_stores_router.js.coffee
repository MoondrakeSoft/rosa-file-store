class RosaFileStore.Routers.FileStoresRouter extends Backbone.Router
  initialize: (options) ->
    @file_stores = new RosaFileStore.Collections.FileStoresCollection()
    @file_stores.reset options.file_stores

  routes:
    "" : "index"

  index: ->
    $("#file_store_uploader").pluploadQueue
      runtimes: 'html5'
      multiple_queues: true
      url: RosaFileStore.config.apiPrefix + 'upload'
      file_data_name: 'file_store[file]'

    @search_view = new RosaFileStore.Views.FileStores.IndexView(file_stores: @file_stores)
    $("#file_stores").html(@search_view.render().el)
