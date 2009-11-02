require 'dm-core/adapters/abstract_adapter'
require 'open-uri'

module DataMapper
  module Adapters
    class MeetupAdapter < AbstractAdapter
      
      attr_reader :api_key

      def initialize name, options
        raise DataMapper::RepositoryNotSetupError unless options[:api_key]
        @api_key = options[:api_key]
        super
      end
      
      def read query
        resource     = query.model.to_s.sub(/.+::/, '').pluralize.downcase
        query_params = [ "key=#{ @api_key }" ]
        query_string = query_params.join "&"
        url          = "http://api.meetup.com/#{ resource }.json?#{ query_string }"
        
        puts "Attempting to open #{ url }"
        Kernel.open url
      end

    end
  end
end