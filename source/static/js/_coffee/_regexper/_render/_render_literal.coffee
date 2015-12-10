_renderLiteral = (group, exp)->
  label = group.group()
  _renderLabel label, ['\u201c', exp, '\u201d']
  spans = label.selectAll('tspan');
  spans[0].addClass 'quote'
  spans[2].addClass 'quote'
  label.select('rect').attr rx: 3,ry: 3
  return