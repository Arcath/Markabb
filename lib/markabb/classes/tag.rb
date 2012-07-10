module Markabb
    # The hash which markabb stores all the avaliable tags in
    Tags = {}
    
    # Inserts a tag into Markabb::Tags
    #
    # Takes 3 inputs:
    #   name - a symbol which is used as its key
    #   tag - a Markabb::Tag object
    #   group - a way to group similar tags so they can all be disabled
    #
    # register_tag(:foo, Markabb::Tag, :bar)
    #
    # would produce a tags hash of
    #
    # {:bar => {:foo => Markabb::Tag}}
    def self.register_tag(name, tag, group = nil)
        tag.name = name
        if group
            tag.group = group
            Tags[group] ||= {}
            Tags[group][name] = tag
        else
            Tags[name] = tag
        end
    end
    
    # Removes a tag from Markabb::Tags
    # takes the symbol for the key to delete
    def self.remove_tag(name)
        Tags.delete(name)
    end
    
    # Used for all tags (passed to register_tag)
    # Takes a REGEX matcher and a string to replace it with
    class Tag
        attr_reader :matcher, :replace
        attr_accessor :name, :group
        
        # Creates the Markabb::Tag object
        def initialize(matcher, replace)
            if matcher.is_a? String
                @matcher = generate_matcher(matcher)
            elsif matcher.is_a? Regexp
                @matcher = matcher
            else
                raise 'matcher is not valid'
            end
            @replace = replace
        end
        
        # Runs the tag on the input string
        #
        # Takes the target string and a Markabb::Config object
        def run(s, config)
            s.gsub(@matcher, generate_replacement(@replace, config))
        end
        
        private
        
        def generate_replacement(replace, config)
            if replace.scan(/config\[:(.*?)\]/) != [] then
                return replace.gsub(/config\[(.*?)\]/, config[$1.to_sym])
            else
                return replace
            end
        end
        
        def generate_matcher(tag)
            /\[#{tag}\](.*?)\[\/#{tag}\]/
        end
    end
end