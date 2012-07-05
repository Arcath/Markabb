module Markabb
    SyntaxHighlighters = {}
    
    def self.register_highlighter(name, highlighter)
        SyntaxHighlighters[name] = highlighter
    end
    
    def self.remove_highlighter(name)
        SyntaxHighlighters.delete(name)
    end
    
    class SyntaxHighlighter
        def initialize(config)
            @config = config
        end
        
        def run(s)
            out = s
            out.scan(/\[code lang=(.+?)\](.+?)\[\/code\]/m).each do |lang, parse|
                out = parse(lang, parse)
            end
            return out
        end
    end
end