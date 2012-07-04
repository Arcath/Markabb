class NobbcTag
    attr_accessor :name, :group
    def initialize
    end
    
    def run(s, config)
        s.gsub(/\[nobbc\](.*?)\[\/nobbc\]/) { |b| b.gsub(/\[nobbc\]/,'').gsub(/\[\/nobbc\]/,'').gsub("[","&#91;").gsub("]","&#93") }
    end
end
Markabb.register_tag :nobbc, NobbcTag.new