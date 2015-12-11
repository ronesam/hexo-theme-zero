_parser = (exp)->
  result = {}
  reg = /\/([igm]{0,3})$/
  reg = exp.match 
  #解析标志位
  result.flag = _parserFlag exp
  result.exps = [
    {
      type: 'Anchor',
      content: '页首'
    },{
      type: 'Literal', 
      content: '['
    },{
      type: 'Subexp',
      content: []
    },{
      type: 'Literal', 
      content: ']'
    },{
      type: 'Anchor',
      content: '行尾'
    }]
  
  return result

exports.parser = _parser