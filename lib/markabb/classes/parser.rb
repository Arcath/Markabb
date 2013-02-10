module Markabb
    # Markab parser
    # Takes a Markabb::Config object and a string as an input
    class Parser
        attr_reader :output
        
        # Creates the parser object
        def initialize(config, s)
            @string = s
            @config = config
            @output = @string
            parse
        end
        
        private
        
        def parse
            disable_html if @config.disable_html
            add_line_breaks
            highlight_syntax
            no_bbc_tag
            run_tags
        end
        
        def highlight_syntax
            highlighter = SyntaxHighlighters[@config.syntax_highlighter].new(@config)
            @output = highlighter.run(@output)
        end
        
        def no_bbc_tag
            apply_tag(Markabb::NobbcTag.new) unless @config[:disable_nobbc]
        end
        
        def run_tags
            Markabb::Tags.each do |k, v|
                if v.is_a? Hash
                    unless @config["disable_#{k}".to_sym]
                        v.each do |sk, sv|
                            apply_tag(sv) unless @config["disable_#{sk}".to_sym]
                        end
                    end
                else
                    apply_tag(v)
                end
            end
        end
        
        def apply_tag(tag)
            @output = tag.run(@output, @config)
        end
        
        def disable_html
            @output = @output.gsub("<","&lt;").gsub(">","&gt;").gsub(/"/, "&quot;")
        end
        
        def add_line_breaks
            @output = @output.gsub(/\n/, '<br />')
            @output = @output.gsub(/<br \/>\[(ul|li|ol|tr|td|th)/,'[\1').gsub(/<br \/>\[\/(ul|li|ol|table|tr|td|th)/,'[/\1')
        end
    end
end