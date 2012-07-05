module Markabb
    module Highlighters
        class Raw < Markabb::SyntaxHighlighter
            def parse(lang, s)
               return "<#{open_tag}>[nobbc]#{s}[/nobbc]</#{close_tag}>" 
            end
            
            def open_tag
                tag = (@config.raw_highlighter_tag || "code")
                return tag + " #{@config.raw_highlighter_tag_options}" if @config.raw_highlighter_tag_options
                return tag
            end
            
            def close_tag
                (@config.raw_highlighter_tag || "code")
            end
        end
    end
end

Markabb.register_highlighter(:raw, Markabb::Highlighters::Raw)
