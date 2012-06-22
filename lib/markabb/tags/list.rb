Markabb.register_tag :un_ordered, Markabb::Tag.new(/\[ul\](.*?)\[\/ul\]/, '<ul>\1</ul>'), :list
Markabb.register_tag :ordered, Markabb::Tag.new(/\[ol\](.*?)\[\/ol\]/, '<ol>\1</ol>'), :list
Markabb.register_tag :list_item, Markabb::Tag.new(/\[li\](.*?)\[\/li\]/, '<li>\1</li>'), :list