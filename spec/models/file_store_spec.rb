require 'rails_helper'

RSpec.describe FileStore, type: :model do

  let(:file_store) { build(:file_store) }

  it { is_expected.to validate_presence_of(:file) }
  it { is_expected.to validate_presence_of(:sha1_hash) }

  it 'is valid given valid attributes' do
    expect(file_store).to be_valid
  end

end
