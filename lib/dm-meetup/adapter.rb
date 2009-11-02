require 'dm-core/adapters/abstract_adapter'
require 'open-uri'

module DataMapper
  module Adapters
    class MeetupAdapter < AbstractAdapter
      
      attr_reader :api_key

      def initialize name, options
        super
        @api_key = options[:api_key] if options[:api_key]
      end
      
      def read query
        uri = "http://api.meetup.com/"
        open uri
      end

    end
  end
end