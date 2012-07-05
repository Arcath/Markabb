module Markabb
    module Highlighters
        # Raw syntax highlighter
        #
        # Just wraps the code in a specified tag.
        class Raw < Markabb::SyntaxHighlighter
            # Parses the inputted text, takes 2 options, the language of the code and the code.
            def parse(lang, s)
               return "<#{open_tag}>[nobbc]#{s}[/nobbc]</#{close_tag}>" 
            end
            
            private
            
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
