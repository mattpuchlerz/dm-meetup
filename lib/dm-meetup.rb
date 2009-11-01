require 'datamapper'

Dir["#{ File.expand_path File.dirname(__FILE__) }/dm-meetup/*.rb"].each { |file| require file }