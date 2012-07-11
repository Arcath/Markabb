require 'spec_helper'

describe Markabb::Callback do
    it "should take a proc" do
        cb = Markabb::Callback.new(Proc.new { })
    end
    
    it "should take an argument and pass it to the proc" do
        sample_callback.run("this").should eq "THIS"
    end
    
    it "should allow callbacks to be called from Markabb::Tag" do
        Markabb.register_tag :upcase, Markabb::Tag.new('up', sample_callback)
        "[up]this[/up]".markabb.should eq "THIS"
        Markabb.remove_tag :upcase
    end
    
    it "should only parse the contents of the tag" do
        Markabb.register_tag :upcase, Markabb::Tag.new('up', sample_callback)
        "[up]this[/up] that [up]foo[/up]".markabb.should eq "THIS that FOO"
        Markabb.remove_tag :upcase
    end
    
    it "should work with multi input procs" do
        callback = Markabb::Callback.new(Proc.new { |foo, bar|
            "Foo: #{foo}, Bar: #{bar}"
        })
        Markabb.register_tag :foobar, Markabb::Tag.new(/\[foo=(.*?)\](.*?)\[\/foo\]/, callback)
        "[foo=this]that[/foo]".markabb.should eq "Foo: this, Bar: that"
        Markabb.remove_tag :foobar
    end
end
