require File.dirname(__FILE__) + '/../spec_helper'

def behavior_for_attribute attribute, value
  
  it "should read the #{ attribute }" do
    @group.attribute_set attribute, value
    eval %Q{ @group.#{ attribute }.should == value }
  end

  it "should not write the #{ attribute }" do
    lambda { 
      eval %Q{ @group.#{ attribute } = value }
    }.should raise_error
  end      
  
end

describe Meetup::Group do
  
  describe "instances" do
    
    before :each do
      @group = Meetup::Group.new 
    end
    
    behavior_for_attribute :id, 123
    
  end
  
end