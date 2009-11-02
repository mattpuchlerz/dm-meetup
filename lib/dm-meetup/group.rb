module Meetup
  class Group
    
    include DataMapper::Resource
    
    property :created_at,   DateTime, :writer => :private
    property :description,  Text,     :writer => :private
    property :id,           Integer,  :writer => :private, :key => true
    property :name,         String,   :writer => :private
    property :member_count, Integer,  :writer => :private
    property :photo_url,    String,   :writer => :private
    property :postal_code,  String,   :writer => :private
    property :url,          String,   :writer => :private
    
  end
end