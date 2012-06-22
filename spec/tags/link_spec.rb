require 'spec_helper'

describe "Link Tags" do
    it "should parse urls" do
        default_config
        Markabb.parse("[url]http://www.example.com[/url]").should eq('<a href="http://www.example.com" target="_BLANK">http://www.example.com</a>')
    end
    
    it "should change the target if asked" do
        default_config
        Markabb.parse "[url]http://www.example.com[/url]" do |c|
            c.url_target = "waffle"
        end.should eq('<a href="http://www.example.com" target="waffle">http://www.example.com</a>')
    end
    
    it "should change the title when using that tag" do
        default_config
        Markabb.parse("[url=http://www.example.com]Example[/url]").should eq('<a href="http://www.example.com" target="_BLANK">Example</a>')
    end
end