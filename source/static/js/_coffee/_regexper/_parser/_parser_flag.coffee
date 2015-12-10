_parserFlag = (exp)->
  flag = []
  explain = {
    g: 'Global', 
    i: 'Ignore Case',
    m: 'Multiline'
  }

  

  if reg and reg[1]
    len = reg[1].length + 1
    flag.push explain[reg[1].substr(-len, 1)] while len -= 1 

  return flag