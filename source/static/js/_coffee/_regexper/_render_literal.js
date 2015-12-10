// Generated by CoffeeScript 1.10.0
var _renderLiteral;

_renderLiteral = function(group, exp) {
  var label, spans;
  label = group.group();
  _renderLabel(label, ['\u201c', exp, '\u201d']);
  spans = label.selectAll('tspan');
  spans[0].addClass('quote');
  spans[2].addClass('quote');
  label.select('rect').attr({
    rx: 3,
    ry: 3
  });
};