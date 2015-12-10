_renderRoot = (group, res)->
  #标记层
  if res.flag.length > 0
    flag = group.text(0, 0, 'Flag: ' + res.flag.join(', '));
  
  res.match = if res.flag.length > 0 then flag.getBBox().height else 0
  #匹配层
  match = _renderGroup group, 'Match', res

  box = match.getBBox()

  #中轴线
  path = 'M' + box.x + ',' + box.cy + 'H0M' + box.x2 + ',' + box.cy + 'H' + (box.x2 + 10)
  group.path path

  #起始位置
  group.circle 0, box.cy, 5
  group.circle box.x2 + 10, box.cy, 5

  return group