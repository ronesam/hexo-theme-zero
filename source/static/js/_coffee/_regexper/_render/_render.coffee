_render = (svg, exp)->
  res = _parser exp
  #这里保留一下，match的时候作为选择器要用
  res.svg = svg
  svg = Snap svg
  group = _renderGroup svg, 'Root', res

  #适合画布
  box = group.getBBox()
  group.transform Snap.matrix().translate 10 - box.x, 10 - box.y
  svg.attr width: box.width + 20, height: box.height + 20

_renderGroup = (svg, type, exp)->
  #先按类型组合
  class_name = type
  group = svg.group().addClass(class_name.toLowerCase())
  #注意type首字母大写
  (eval('_render' + type)) group, exp

#渲染纯文本
_renderLabel = (group, text)->
  label = group.addClass 'label'
  rect = label.rect()
  text = label.text 0, 0, text
  box = text.getBBox()
  margin = 5
  text.transform Snap.matrix().translate margin, box.height / 2 + 2 * margin;
  rect.attr({
    width: box.width + 2 * margin,
    height: box.height + 2 * margin
  });
  return label

#渲染标签盒
_renderLabeledBox = (svg, text)->
  return

exports.render = _render