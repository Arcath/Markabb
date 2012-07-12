module Markabb
    # Class for callbacks, all callbacks should be an instance of this.
    class Callback
        def initialize(proc)
            @proc = proc
        end
        
        # Passes all the options found in the gsub from the tag (see Markabb::Tag) to the Proc
        def run(ar)
            @proc.call *ar 
        end
    end
end