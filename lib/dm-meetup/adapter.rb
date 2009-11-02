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
        resource     = query.model.to_s.pluralize.downcase
        query_params = [ "key=#{ @api_key }" ]
        query_string = query_params.join "&"
        Kernel.open "http://api.meetup.com/#{ resource }.json?#{ query_string }"
      end

    end
  end
end