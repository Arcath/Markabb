require 'spec_helper'

describe "List Tags" do
    include MarkabbMacros::Formatting
    
    it_should_apply_formatting ['un_ordered', 'ul'],
        ['ordered', 'ol'],
        ['list_item', 'li']
end