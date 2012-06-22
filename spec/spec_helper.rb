# Macros
require "macros/formatting_macros"
# Require Markabb
require 'lib/markabb'

module Markabb
    def self.blank_config
        @config = nil
    end
end

def default_config
    Markabb.configure do |c|
    end
end