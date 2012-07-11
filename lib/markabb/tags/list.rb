list_callback = Markabb::Callback.new(Proc.new { |s|
    if s =~ /\[\*\]/
        tag = "ul"
    elsif s =~ /\[#\]/
        tag = "ol"
    end
    
    items = s.gsub(/\[list\]/, '').gsub(/\[\/list\]/, '').gsub(/\[(\*|#)\](.*?)(\[|<|$)/, '<li>\2</li>\3').gsub(/<\/li><br \/><li>/, '</li><li>')
    
    "<#{tag}>#{items}</#{tag}>"
})

Markabb.register_tag :un_ordered, Markabb::Tag.new('ul', '<ul>\1</ul>'), :lists
Markabb.register_tag :ordered, Markabb::Tag.new('ol', '<ol>\1</ol>'), :lists
Markabb.register_tag :list_item, Markabb::Tag.new('li', '<li>\1</li>'), :lists
Markabb.register_tag :smart_list, Markabb::Tag.new(/\[list\](.*?)\[\/list\]/, list_callback), :lists
