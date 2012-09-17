RosaFileStore.Views.FileStores ||= {}

class RosaFileStore.Views.FileStores.FileStoreView extends Backbone.View
  template: JST["backbone/templates/file_stores/file_store"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
