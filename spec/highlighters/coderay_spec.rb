require 'spec_helper'

describe Markabb::Highlighters::Coderay do
    it "should be selectable" do
        default_config
        Markabb.config.syntax_highlighter = :coderay
        "[code lang=ruby]:foo => 'bar'[/code]".markabb
    end
    
    it "should allow you configure coderay" do
        default_config
        Markabb.config.syntax_highlighter = :coderay
        Markabb.config.coderay_options = {:line_numbers => :inline}
        "[code lang=ruby]:foo => 'bar'[/code]".markabb.should =~ /"#n1"/
    end
end