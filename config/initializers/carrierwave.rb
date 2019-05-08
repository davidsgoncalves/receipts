CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['aws_access_key_id'],
        :aws_secret_access_key => ENV['aws_secret_access_key'],
        :region => ENV["aws_region"]
    }
    config.fog_directory = ENV["fog_directory"]
    config.fog_public = true
end

# CarrierWave.configure do |config|
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#         :provider => 'AWS',
#         :aws_access_key_id => 'AKIATKYZTIDDXKTXO2FQ',
#         :aws_secret_access_key => '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',
#         :region => 'us-east-2'
#     }
#     config.fog_directory = 'billsreceipts'
#     config.fog_public = true
# end