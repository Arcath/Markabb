# Macros
require "macros/formatting_macros"
# Require Markabb
require 'markabb'

module Markabb
    def self.blank_config
        @config = nil
    end
end

def default_config
    Markabb.configure do |c|
    end
end

def sample_tag
    Markabb.register_tag :test, Markabb::Tag.new(/foo/, 'bar'), :group
end