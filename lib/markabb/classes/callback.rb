module Markabb
    class Callback
        def initialize(proc)
            @proc = proc
        end
        
        def run(ar)
            @proc.call *ar 
        end
    end
end