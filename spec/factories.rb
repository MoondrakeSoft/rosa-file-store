require 'factory_girl'
require 'ffaker'

FactoryGirl.define do

  factory :file_store do
    sequence(:sha1_hash)    { |_| SecureRandom.hex(20) }
    file                    File.open("#{Rails.root}/spec/fixtures/file.txt")
  end

end
