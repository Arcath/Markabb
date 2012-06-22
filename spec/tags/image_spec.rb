require 'spec_helper'

describe "Image Tags" do
    it "should apply the image tag" do
        default_config
        Markabb.parse("[img]http://www.example.com/img.png[/img]").should eq('<img src="http://www.example.com/img.png" alt="Posted Image" />')
    end
    
    it "should apply the image tag with alt" do
        default_config
        Markabb.parse("[img alt=Alt Tag]http://www.example.com/img.png[/img]").should eq('<img src="http://www.example.com/img.png" alt="Alt Tag" />')
    end
end