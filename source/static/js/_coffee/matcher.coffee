$ ->
  $('#regexper').click ->
    $('#svg .root').remove()
    $('#svg').show()
    regexper.render '#svg', '//\[([+*])([a-z]+)\] *(\S*)\n/img/'
    return

  time = 0

  $('#match').click ->
    time++
    $('#found-times').html time
    match_times = $ '#match-times'
    result = $ '#match-result'
    result.empty()
    val = $('#match-input').val()
    reg = $('#regexp-input').val()
    if !val || !reg
       match_times.html 0
       return true
    arr = reg.match /(\/?)(.+)(\1)([ig]*)/
    reg = new RegExp arr[2], arr[4]
    count = 0

    val.replace reg, ->
      back = back = ['<li><ul>']
      count++;
      back.push '<li>此为第 <i>' + count + '</i> 处匹配：</li>'
      back.push '<li>$' + i + ':<span style="padding-left:1em">' + arg + '</span></li>' for arg, i in arguments when i < arguments.length - 3
      back.push '</ul></li>'
      result.append back.join ''
      return
    if !count
      match_times.html 0
    else
      match_times.html count
      result.show()
    return
  return