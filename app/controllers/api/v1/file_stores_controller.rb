class Api::V1::FileStoresController < Api::ApplicationController
  # GET /file_stores?hash=3a93e5553490e39b4cd50269d51ad8438b7e20b8
  # GET /file_stores.json?hash=3a93e5553490e39b4cd50269d51ad8438b7e20b8
  def index
    @file_stores = FileStore.by_hash(params[:hash])

    render json: @file_stores
  end

  # GET /file_stores/3a93e5553490e39b4cd50269d51ad8438b7e20b8
  # GET /file_stores/3a93e5553490e39b4cd50269d51ad8438b7e20b8.json
  def show
    @file_store = FileStore.find_by_sha1_hash!(params[:id])

    # render json: @file_store
    send_file @file_store.file.path
  end

  # # GET /file_stores/new
  # # GET /file_stores/new.json
  # def new
  #   @file_store = FileStore.new
  # 
  #   render json: @file_store
  # end

  # POST /file_stores
  # POST /file_stores.json
  def create
    @file_store = FileStore.new(params[:file_store])

    if @file_store.save
      render json: @file_store, status: :created #, location: @file_store
    else
      render json: @file_store.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /file_stores/1
  # # PATCH/PUT /file_stores/1.json
  # def update
  #   @file_store = FileStore.find(params[:id])
  # 
  #   if @file_store.update_attributes(params[:file_store])
  #     head :no_content
  #   else
  #     render json: @file_store.errors, status: :unprocessable_entity
  #   end
  # end
  # 
  # # DELETE /file_stores/1
  # # DELETE /file_stores/1.json
  # def destroy
  #   @file_store = FileStore.find(params[:id])
  #   @file_store.destroy
  # 
  #   head :no_content
  # end
end
