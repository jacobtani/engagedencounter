require 'sib-api-v3-sdk'

SibApiV3Sdk.configure do |config|
  # Configure API key authorization: api-key
  config.api_key['api-key'] = Rails.application.credentials.send_blue_api_key!
end

api_instance = SibApiV3Sdk::EmailCampaignsApi.new
