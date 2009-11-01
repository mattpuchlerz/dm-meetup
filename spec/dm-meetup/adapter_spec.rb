require File.dirname(__FILE__) + '/../spec_helper'
require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::MeetupAdapter do
  
  before :all do
    @adapter = DataMapper.setup :default, :adapter => 'meetup'
  end

  it_should_behave_like 'An Adapter'

end