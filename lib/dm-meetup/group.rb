module Meetup
  class Group
    
    include DataMapper::Resource
    
    property :id, Integer, :writer => :private, :key => true
    
  end
end