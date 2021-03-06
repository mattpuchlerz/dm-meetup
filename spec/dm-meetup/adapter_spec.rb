require File.dirname(__FILE__) + '/../spec_helper'
# require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::MeetupAdapter do
  
  before :all do
    
    @adapter = DataMapper.setup :default, :adapter => 'meetup',
                                          :api_key => 'HereIsMyApiKey1234567890'
    
    module ::Pooh
      class Heffalump
        include DataMapper::Resource
        property :id,        Serial
        property :color,     String
        property :num_spots, Integer
        property :striped,   Boolean
      end
    end
    
    @query = DataMapper::Query.new Pooh::Heffalump.repository, Pooh::Heffalump
    
  end
  
  before :each do
    # Not sure why this can't be #before(:all)
    OpenURI.stub!(:open_uri).and_return ''    
  end
  
  it "should require the passing of an API key" do
    lambda {
      DataMapper.setup :default, :adapter => 'meetup'
    }.should raise_error(DataMapper::RepositoryNotSetupError)
  end

  it "should read the API key" do
    @adapter.api_key.should == 'HereIsMyApiKey1234567890'
  end
  
  it "should implement #read" do
    lambda { 
      @adapter.read @query
    }.should_not raise_error(NotImplementedError)
  end
  
  it "should make a request when trying to read" do
    Kernel.
      should_receive(:open).
      with('http://api.meetup.com/heffalumps.json?key=HereIsMyApiKey1234567890')
    @adapter.read @query
  end
  
  it "should not raise any errors when querying a model" do
    lambda {
      Pooh::Heffalump.all
      Pooh::Heffalump.first
    }.should_not raise_error
  end
  
  # it_should_behave_like 'An Adapter'
  # 
  # Note that we aren't utilizing all of the standard 
  # adapter behaviors here because we only care about 
  # reading for the time being.

end