require File.dirname(__FILE__) + '/../spec_helper'

def behavior_for_property property, value
  
  it "should read the #{ property }" do
    @group.attribute_set property, value
    eval %Q{ @group.#{ property }.should == value }
  end

  it "should not write the #{ property }" do
    lambda { 
      eval %Q{ @group.#{ property } = value }
    }.should raise_error
  end      
  
end

describe Meetup::Group do
  
  describe "instances" do
    
    before :each do
      @group = Meetup::Group.new 
    end
    
    behavior_for_property :created_at,    DateTime.now
    behavior_for_property :description,   'This is the groups description!'
    behavior_for_property :id,            123
    behavior_for_property :name,          'The Group Name'
    behavior_for_property :member_count,  94
    behavior_for_property :photo_url,     'http://meetup.com/Refresh-Chicago/path/to/image.png'
    behavior_for_property :postal_code,   '90210'
    behavior_for_property :url,           'http://meetup.com/Refresh-Chicago'
    
  end
  
end