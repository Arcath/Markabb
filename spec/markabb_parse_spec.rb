require 'spec_helper'

describe Markabb, "#parse" do
    it "should take a string" do
        default_config
        Markabb.parse "this"
    end
    
    it "should raise a exception if Markabb is not configured" do
        Markabb.blank_config
        lambda { Markabb.parse "this" }.should raise_exception
    end
    
    it "should allow for config via a block" do
        default_config
        Markabb.parse "this" do |c|
            c.foo = 'bar'
        end
    end
    
    it "should allow for no config if using a block" do
        Markabb.blank_config
        Markabb.parse "this" do |c|
            c.foo = 'bar'
        end
    end
    
    it "should disable html" do
        default_config
        Markabb.parse("<b>BOLD</b>").should eq "&lt;b&gt;BOLD&lt;/b&gt;"
    end
    
    it "should allow html if told to" do
        default_config
        Markabb.parse "<b>BOLD</b>" do |c|
            c.disable_html = false
        end.should eq "<b>BOLD</b>"
    end
    
    it "should add line breaks" do
        default_config
        Markabb.parse("this\nthat").should eq "this<br />that"
    end
    
    it "should correct line breaks" do
        default_config
        Markabb.parse("this\nthat\n[table]\n[tr][/tr]\n[/table]").should eq "this<br />that<br /><table width=\"100%\"><tr></tr></table>"
    end
end