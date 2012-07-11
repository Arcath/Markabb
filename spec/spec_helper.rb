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

def sample_proc
    Proc.new { |s| upcase(s) }
end

def sample_callback
    Markabb::Callback.new(sample_proc)
end

def upcase(s)
    s.upcase
end