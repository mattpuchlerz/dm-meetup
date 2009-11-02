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
        uri = "http://api.meetup.com/"
        open uri
      end

    end
  end
end