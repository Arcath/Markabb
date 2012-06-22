Markabb.register_tag :bold, Markabb::Tag.new(/\[b\](.*?)\[\/b\]/, '<b>\1</b>'), :formatting
Markabb.register_tag :italic, Markabb::Tag.new(/\[i\](.*?)\[\/i\]/, '<i>\1</i>'), :formatting
Markabb.register_tag :underline, Markabb::Tag.new(/\[u\](.*?)\[\/u\]/, '<u>\1</u>'), :formatting
Markabb.register_tag :center, Markabb::Tag.new(/\[center\](.*?)\[\/center\]/, '<center>\1</center>'), :formatting
Markabb.register_tag :left, Markabb::Tag.new(/\[left\](.*?)\[\/left\]/, '<left>\1</left>'), :formatting
Markabb.register_tag :right, Markabb::Tag.new(/\[right\](.*?)\[\/right\]/, '<right>\1</right>'), :formatting
Markabb.register_tag :heading_1, Markabb::Tag.new(/\[h1\](.*?)\[\/h1\]/, '<h1>\1</h1>'), :formatting
Markabb.register_tag :heading_2, Markabb::Tag.new(/\[h2\](.*?)\[\/h2\]/, '<h2>\1</h2>'), :formatting
Markabb.register_tag :heading_3, Markabb::Tag.new(/\[h3\](.*?)\[\/h3\]/, '<h3>\1</h3>'), :formatting
Markabb.register_tag :heading_4, Markabb::Tag.new(/\[h4\](.*?)\[\/h4\]/, '<h4>\1</h4>'), :formatting
