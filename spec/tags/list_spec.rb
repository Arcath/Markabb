require 'spec_helper'

describe "List Tags" do
    include MarkabbMacros::Formatting
    
    it_should_apply_formatting ['un_ordered', 'ul'],
        ['ordered', 'ol'],
        ['list_item', 'li']
    
    it "should use ul with smart list *" do
        "[list][*]foo\n[*]bar[/list]".markabb.should eq "<ul><li>foo</li><li>bar</li></ul>"
    end
    
    it "should use ol with smart list #" do
        "[list][#]foo\n[/list]".markabb.should eq "<ol><li>foo</li></ol>"
    end
end