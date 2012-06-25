# Ruby String object, used to add .markabb
class String
    
    # Runs Markabb parser for the string
    def markabb
        Markabb.parse self do
        end
    end
end
