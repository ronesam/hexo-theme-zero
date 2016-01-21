#右侧边栏相关代码
$ ->
  #No.1 回到顶部
  up = $ '.icon-arrow-up'
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
  toc = $ 'article.toc'
  if '' == toc.html()
    $('.icon-toc').hide()

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
  $ ->
    path = window.location.pathname
    arr_path = path.split '/'
    #回到根目录
    arr_url = arr_path.slice 0, 2
    url = '//' + window.location.host + arr_url.join('/') + '/summary/index.json'
    $.getJSON url, (json)->
      $('article.summary').html json.summary
      $('article.summary blockquote').hide()
      option = $('article.summary a[href="' + path + '"]')
      file_name = option.html()
      option.html('<span style="color:orange">' + file_name + '</span>')

      if option.parent().prev().length
        $('.icon-prev').html option.parent().prev().html()
        $('.icon-prev a').html ''
      else
        $('.icon-prev').hide()

      if option.parent().next().length
        $('.icon-next').html option.parent().next().html()
        $('.icon-next a').html ''
      else
        $('.icon-next').hide()
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