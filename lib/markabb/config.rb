module Markabb
    # The config class, inherits from Hash
    # Borrowed from mina (https://github.com/nadarei/mina)
    class Config < Hash
        def initialize
            super
            load_default_config
        end
        
        # Allows access to the hash though methods
        # Provides all getter, setter and query methods for any key in the hash
        def method_missing(meth, *args, &blk)
            name = meth.to_s
            return evaluate(self[meth])  if name.size == 1
            # Ruby 1.8.7 doesn't let you do string[-1]
            key, suffix = name[0..-2].to_sym, name[-1..-1]
            case suffix
                when '='
                    self[key] = args.first
                when '?'
                    include? key
                when '!'
                    raise Error, "Setting :#{key} is not set" unless include?(key)
                    evaluate self[key]
                else
                    evaluate self[meth]
            end
        end

        # Returns a value or runs a proc depending on the value in the hash
        def evaluate(value)
            if value.is_a?(Proc)
                value.call
            else
                value
            end
        end
        
        # Sets the default config values
        def load_default_config
            self[:disable_html] ||= true
            self[:url_target] ||= "_BLANK"
            self[:image_alt] ||= "Posted Image"
            self[:table_width] ||= "100%"
        end
    end
end