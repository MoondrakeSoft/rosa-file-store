require 'rails_helper'

RSpec.describe 'FileStores API V1', type: :request, apiv1: true do
  let(:file_store)  { create(:file_store) }

  describe 'index' do
    it 'is successful' do
      get "/api/v1/file_stores", hash: file_store.sha1_hash
      expect(response).to be_success
    end
  end

  describe 'show' do
    it 'is successful' do
      get "/api/v1/file_stores/#{file_store.sha1_hash}"
      expect(response).to be_success
    end
  end

end
