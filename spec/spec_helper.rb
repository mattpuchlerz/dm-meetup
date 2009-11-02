$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '../lib/' )

require 'dm-meetup'

DataMapper.setup :default, :adapter => 'meetup',
                           :api_key => 'HereIsMyApiKey1234567890'
