parser = (expression)->
  return {
    exps: [
      {
        type: 'anchor',
        content: '页首'
      },{
        type: 'literal', 
        content: '['
      },{
        type: 'subexp',
        content: []
      },{
        type: 'literal', 
        content: ']'
      },{
        type: 'anchor',
        content: '行尾'
      }],
    flags: ['Global', 'Ignore Case', 'Multiline']
  }

exports.parser = parser