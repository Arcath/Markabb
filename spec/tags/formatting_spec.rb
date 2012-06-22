require 'spec_helper'

describe "Formatting Tags" do
    include MarkabbMacros::Formatting
    
    it_should_apply_formatting ['bold','b'],
        ['italic','i'],
        ['underline','u'],
        ['un_ordered', 'ul'],
        ['ordered', 'ol'],
        ['list_item', 'li'],
        ['center', 'center'],
        ['left', 'left'],
        ['right', 'right'],
        ['heading_1', 'h1'],
        ['heading_2', 'h2'],
        ['heading_3', 'h3'],
        ['heading_4', 'h4']
        
    it "should disable all formatting" do
        Markabb.configure do |c|
            c.disable_formatting = true
        end
        Markabb.parse("[b]Bold[/b]").should eq("[b]Bold[/b]")
    end
end