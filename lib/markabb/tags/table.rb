Markabb.register_tag :table, Markabb::Tag.new('table', '<table width="config[:table_width]">\1</table>'), :table
Markabb.register_tag :table_tr, Markabb::Tag.new('tr', '<tr>\1</tr>'), :table
Markabb.register_tag :table_td, Markabb::Tag.new('td', '<td>\1</td>'), :table
Markabb.register_tag :table_header, Markabb::Tag.new('th', '<th>\1</th>'), :table
Markabb.register_tag :table_row, Markabb::Tag.new('row', '<tr>\1</tr>'), :table
Markabb.register_tag :table_cell, Markabb::Tag.new('cell', '<td>\1</td>'), :table
