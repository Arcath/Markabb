# Top Level Requires
require "markabb/config"
require "markabb/parse"
require "markabb/version"
# Clases
require "markabb/classes/parser"
require "markabb/classes/tag"
require "markabb/classes/string"
require "markabb/classes/syntax_highlighter"
# Highlighters
require "markabb/highlighters/raw"

# Main Markabb Module, all code is a sub of this
module Markabb
    # Exposes a new config object to a block
    # Called with:
    #     Markabb.configure do |c|
    #         c.foo = 'bar'
    #     end
    def self.configure
        @config = Config.new
        yield @config
    end
    
    # Exposes the config object for use in your code
    def self.config
        @config
    end
    
    # Contains all stock provided syntax highlighters
    module Highlighters
    end
end

# Tags
require "markabb/tags/formatting"
require "markabb/tags/image"
require "markabb/tags/link"
require "markabb/tags/list"
require "markabb/tags/nobbc"
require "markabb/tags/table"