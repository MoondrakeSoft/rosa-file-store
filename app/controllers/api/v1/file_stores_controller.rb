class Api::V1::FileStoresController < Api::ApplicationController
  require 'net/http'
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_filter :authenticate, :only => :create

  # GET /file_stores?hash=3a93e5553490e39b4cd50269d51ad8438b7e20b8
  # GET /file_stores.json?hash=3a93e5553490e39b4cd50269d51ad8438b7e20b8
  def index
    @file_stores = FileStore.by_hash(params[:hash]).select(:sha1_hash, :file)

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
    user = JSON.parse(@res.body)['user']
    @file_store = FileStore.new(params[:file_store])
    @file_store.user_id, @file_store.user_uname = user['id'], user['uname']

    if @file_store.save
      mes = {:sha1_hash => @file_store.sha1_hash}
      render json: mes, status: :created #, location: @file_store
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

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      uri = URI.parse('https://abf.rosalinux.ru/api/v1/user.json')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new(uri.request_uri,initheader = {'Content-Type' =>'application/json'})
      req.basic_auth user, pass
      @res= http.request(req)
      return true if @res.code == '200'
      message = {} # Plupload expect array at values
      JSON.parse(@res.body).each {|k, v| message["#{k.capitalize}:"] = [v]}
      render json: message, status: @res.code.to_i
      return false
    end
  end
end
