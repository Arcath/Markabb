require 'spec_helper'

describe Markabb::Highlighters::Raw do
    it "should be able to parse a code tag" do
        "[code lang=ruby]def foo(bar)
        return bar
        end[/code]".markabb.should eq "<code>def foo(bar)<br />        return bar<br />        end</code>"
    end
    
    it "should let you change the wrapping tag" do
        Markabb.configure do |c|
            c.raw_highlighter_tag = "div"
        end
        "[code lang=ruby]def foo(bar)
        return bar
        end[/code]".markabb.should eq "<div>def foo(bar)<br />        return bar<br />        end</div>"
    end
    
    it "should let you change html options of the tag" do
        Markabb.configure do |c|
            c.raw_highlighter_tag = "div"
            c.raw_highlighter_tag_options = "class=\"well\""
        end
        "[code lang=ruby]def foo(bar)
        return bar
        end[/code]".markabb.should eq "<div class=\"well\">def foo(bar)<br />        return bar<br />        end</div>"
    end
end
