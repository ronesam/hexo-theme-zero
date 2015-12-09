_match = (group, res)->
  group.transform Snap.matrix().translate 10, res.match
 
  #渲染子匹配
  _render(group, exp.type, exp.content) for exp in res.exps

  #展开并连接
  items = group.selectAll(res.svg + ' > g > g > g')
  #保留偏移宽度
  item_width = [0]
  item_padding = 10
  _connect = (item, i)->
    box = item.getBBox()
    if 0 == i
      move = 0
    else
      move = item_width[i - 1]
    item_width[i] = move + box.width + item_padding
    item.transform Snap.matrix().translate move, 0
    return

  _connect item, i for item, i in items

  #中间用横线连接
  item_width.splice -1
  box = group.getBBox()
  path = []
  path.push 'M' + line + ',' + box.r1 + 'H' + (line - item_padding) for line in item_width
  group.path path.join('')

  return group