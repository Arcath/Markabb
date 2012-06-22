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
        Parser.new(config, s).output
    end
end