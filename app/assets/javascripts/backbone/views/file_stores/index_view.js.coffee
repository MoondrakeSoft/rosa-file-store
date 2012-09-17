RosaFileStore.Views.FileStores ||= {}

class RosaFileStore.Views.FileStores.IndexView extends Backbone.View
  template: JST["backbone/templates/file_stores/index"]

  id: 'search_results'

  initialize: () ->
    $('div').on('submit', 'form#search', @searchFile) # to force event work outside template
    @options.file_stores.bind('reset', @render)

  addAll: () =>
    @options.file_stores.each(@addOne)

  addOne: (file_store) =>
    view = new RosaFileStore.Views.FileStores.FileStoreView({model : file_store})
    $("#search_results").append(view.render().el)

  searchFile: (e) =>
    @options.file_stores.fetch
      data: 
        hash: $('input#hash').val()
      processData: true

    $("#file_stores").show()

    return false

  render: =>
    $(@el).html(@template(file_stores: @options.file_stores.toJSON() ))
    @addAll()

    return this
