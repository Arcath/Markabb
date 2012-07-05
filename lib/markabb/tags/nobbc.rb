module Markabb
    # NoBBC Tag class, can't use the Markabb::Tag class as this one needs special parsing
    class NobbcTag
        attr_accessor :name, :group
        
        # Runs the NoBBC Tag
        #
        # The same as Markabb::Tag.parse
        def run(s, config)
            s.gsub(/\[nobbc\](.*?)\[\/nobbc\]/) { |b| b.gsub(/\[nobbc\]/,'').gsub(/\[\/nobbc\]/,'').gsub("[","&#91;").gsub("]","&#93") }
        end
    end
end

# Markabb.register_tag :nobbc, Markabb::NobbcTag.new