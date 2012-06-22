require 'spec_helper'

describe Markabb::Tag do
    it "should have a tags hash" do
        Markabb::Tags.should be_a Hash
    end
    
    it "should allow tag registration" do
        Markabb.register_tag :foo, Markabb::Tag.new(/foo/, 'bar')
        Markabb::Tags[:foo].should be_a Markabb::Tag
    end
    
    it "should allow tag removal" do
        Markabb.remove_tag :foo
        Markabb::Tags[:foo].should be_nil
    end
    
    it "should have the bold tag" do
        Markabb::Tags[:formatting][:bold].should be_a Markabb::Tag
    end
end