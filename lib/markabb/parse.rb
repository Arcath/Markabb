module Markabb
    # Passes the string to an instance of Markabb::Parser
    #
    # Can be passed a block to change the config
    def self.parse(s)
        # Set the config
        config = @config
        if block_given?
            config = Config.new unless @config
            yield(config)
        else
            raise "Please configure Markabb before using it" unless @config
        end
        output = Parser.new(config, s).output
        if needs_html_safe?
            return output.html_safe
        else
            return output
        end
    end
    
    def self.needs_html_safe?
        if defined? Rails
            return Rails.version =~ /^3\./
        else
            return false
        end
    end
end