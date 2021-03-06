require 'spec_helper'

describe "Table Tags" do
    include MarkabbMacros::Formatting
    
    it_should_apply_formatting ['table_header', 'th'],
        ['table_tr', 'tr'],
        ['table_td', 'td']
        
    it "should draw a table with a width" do
        Markabb.parse("[table]table[/table]").should eq("<table width=\"100%\">table</table>")
    end
    
    it "should alow you to change the width" do
        Markabb.parse "[table]table[/table]" do |c|
            c.table_width = "75%"
        end.should eq("<table width=\"75%\">table</table>")
    end
    
    it "should work for [row]" do
        "[row]..[/row]".markabb.should eq "<tr>..</tr>"
    end
    
    it "should work for [cell]" do
        "[cell]..[/cell]".markabb.should eq "<td>..</td>"
    end
end