#右侧边栏相关代码
$ ->
  #No.1 回到顶部
  up = $ '.icon-arraw-up'
  up.click ->
    $('html, body, .fullscreen').animate {scrollTop: 0}, 1000
    return
  
  showIcon = (top) ->
    if top > 1000
      up.show()
    else
      up.hide()
    return

  $(window).scroll ->
    showIcon $(this).scrollTop()
    return

  #No.2 索引
  toc = $ '[data-remodal-id=toc]'
  inst = toc.remodal()
  toc.click -> 
    inst.close()
    return

  #No.3 评论
  $(document).on 'opening', '[data-remodal-id=comment]', ->
    $.getScript '//static.duoshuo.com/embed.js'
    return
 
  #No.4 全屏/取消全屏
  full = $ '.icon-fullscreen'
  full.click (e)->
    screenfull.toggle '', (isFullscreen)->
      if !isFullscreen
        full.attr('title', '全屏').addClass('icon-fullscreen').removeClass('icon-screenshot')
      else
        full.attr('title', '取消全屏').addClass('icon-screenshot').removeClass('icon-fullscreen')
      return
    return

  #No.5 目录
  $(document).on 'opening', '[data-remodal-id=summary]', ->
    path = window.location.pathname
    arr_path = path.split '/'
    #过滤掉最后两个，回到上级目录
    arr_path.splice -2
    arr_url = []
    arr_url.push dir for dir in arr_path
    url = '//' + window.location.host + arr_url.join('/') + '/summary/index.json'
    $.getJSON url, (json)->
      $('article.summary').html json.summary
      option = $('article.summary a[href="' + path + '"]')
      file_name = option.html()
      option.html('<span style="color:orange">' + file_name + '</span>')
      return
    return
  return

#fullscreen居然不支持回调，这里尝试重写一下
screenfull.toggle = (elem, fn) ->
  if @isFullscreen
    @exit()
    fn false
  else
    @request elem
    fn true
  return