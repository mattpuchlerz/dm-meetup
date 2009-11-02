require File.dirname(__FILE__) + '/../spec_helper'
# require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::MeetupAdapter do
  
  before :all do

    OpenURI.stub!(:open_uri).and_return ''
    
    @adapter = DataMapper.setup :default, :adapter => 'meetup',
                                          :api_key => 'HereIsMyApiKey1234567890'
    
    class ::Heffalump
      include DataMapper::Resource
      property :id,        Serial
      property :color,     String
      property :num_spots, Integer
      property :striped,   Boolean
    end
    
  end
  
  it "should require the passing of an API key" do
    lambda {
      DataMapper.setup :default, :adapter => 'meetup'
    }.should raise_error(DataMapper::RepositoryNotSetupError)
  end

  it "should read a Meetup API key" do
    @adapter.api_key.should == 'HereIsMyApiKey1234567890'
  end
  
  it "should implement #read" do
    lambda { 
      @adapter.read 'query' 
    }.should_not raise_error(NotImplementedError)
  end
  
  it 'should not raise any errors when querying model' do
    lambda {
      Heffalump.all
      Heffalump.first
    }.should_not raise_error
  end
  
  it "should make a request when trying to read" do
    OpenURI.should_receive(:open_uri)
    @adapter.read 'query'
  end
  
  # it_should_behave_like 'An Adapter'
  # 
  # Note that we aren't utilizing all of the standard 
  # adapter behaviors here because we only care about 
  # reading for the time being.

end