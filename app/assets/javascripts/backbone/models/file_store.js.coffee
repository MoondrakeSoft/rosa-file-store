class RosaFileStore.Models.FileStore extends Backbone.Model

class RosaFileStore.Collections.FileStoresCollection extends Backbone.Collection
  model: RosaFileStore.Models.FileStore
  url: RosaFileStore.config.apiPrefix + 'file_stores'
