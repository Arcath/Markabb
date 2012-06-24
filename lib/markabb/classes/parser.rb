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
            run_tags
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
            @output = @output.gsub("<","&lt;").gsub(">","&gt;")
        end
        
        def add_line_breaks
            @output = @output.gsub(/\n/, '<br />')
            @output = @output.gsub(/<br \/>\[(ul|li|ol|tr|td|th)/,'[\1').gsub(/<br \/>\[\/(ul|li|ol|table|tr|td|th)/,'[/\1')
        end
    end
end