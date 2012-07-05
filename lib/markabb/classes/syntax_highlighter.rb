module Markabb
    # The hash which markabb stores all available syntax highlighters in
    SyntaxHighlighters = {}
    
    # Adds a syntac highlighter to the hash
    def self.register_highlighter(name, highlighter)
        SyntaxHighlighters[name] = highlighter
    end
    
    # Removes a syntax highlighter from the hash
    def self.remove_highlighter(name)
        SyntaxHighlighters.delete(name)
    end
    
    # Super class for syntax highlighters
    #
    # All syntax highlighters need to inherit from this class
    class SyntaxHighlighter
        def initialize(config)
            @config = config
        end
        
        # Runs the syntax highlighter
        #
        # Finds all instances of the code tag and passes it to the parse function
        def run(s)
            out = s
            out.scan(/\[code lang=(.+?)\](.+?)\[\/code\]/m).each do |lang, parse|
                out = parse(lang, parse)
            end
            return out
        end
    end
end