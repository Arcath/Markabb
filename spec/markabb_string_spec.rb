require 'spec_helper'

describe String do
    it "should run markabb with the default config for #markabb" do
        Markabb.blank_config
        "[b]this[/b]".markabb.should eq "<b>this</b>"
    end
    
    it "should inherit from main config" do
        default_config
        Markabb.configure do |c|
            c.disable_bold = true
        end
        "[b]this[/b]".markabb.should eq "[b]this[/b]"
    end
end