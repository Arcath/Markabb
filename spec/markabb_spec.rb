require 'spec_helper'

describe Markabb do
    it "should take a block" do
        Markabb.configure do |c|
        end
    end
    
    it "should store config" do
        Markabb.configure do |c|
            c.foo = 'bar'
        end
        
        Markabb.config.foo.should eq 'bar'
    end
end