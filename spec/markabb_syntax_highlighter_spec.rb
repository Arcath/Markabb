require 'spec_helper'

describe "Syntax Highlighters" do
    it "should have the SytaxHighlighters hash" do
        Markabb::SyntaxHighlighters.should be_a Hash
    end
    
    it "should allow for highlighter registration" do
        Markabb.register_highlighter(:foo, Markabb::SyntaxHighlighter.new(Markabb.config))
        Markabb::SyntaxHighlighters[:foo].should be_a Markabb::SyntaxHighlighter
    end
    
    it "should allow for highlighter deletion" do
        Markabb.remove_highlighter(:foo)
    end
    
    it "should have a run action" do
        syntax_highlighter = Markabb::SyntaxHighlighter.new(Markabb.config)
        syntax_highlighter.run("foo")
    end
end