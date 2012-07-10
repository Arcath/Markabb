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
    
    it "should have a name" do
        sample_tag.name.should be_a Symbol
    end
    
    it "should have a group" do
        sample_tag.group.should be_a Symbol
    end
    
    it "should have the nobbc tag" do
        default_config
        "blah [nobbc][b]bold[/b][/nobbc] blah".markabb.should eq "blah &#91;b&#93bold&#91;/b&#93 blah"
    end
    
    it "should support simple tag creators" do
        tag = Markabb::Tag.new('bi', '<b><i>\1</i></b>')
    end
    
    it "should have a working simple tag" do
        default_config
        tag = Markabb::Tag.new('bi', '<b><i>\1</i></b>')
        tag.run("[bi]test[/bi]", Markabb.config).should eq "<b><i>test</i></b>"
    end
    
    it "should raise an exception if a bad matcher is given" do
        lambda { Markabb::Tag.new(7, '<b><i>\1</i></b>') }.should raise_exception
    end
end