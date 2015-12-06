(($) ->
  play = (parent, item, callback)->
    width = parent.width()
    item.imagesLoaded ->
      _this = @[0]
      nWidth = _this.naturalWidth
      nHeight = _this.naturalHeight
      callback()
      @animate opacity: 1, 500
      parent.animate height: width * nHeight / nWidth, 500
      return
    return

  $('.gallery').each ->
    cur = $ @
    point = 0
    photoset = cur.children('.photoset').children()
    all = photoset.length
    loading = true
    play cur, photoset.eq(0), ->
      loading = false
      return

    if all > 1
      cur.on('click', '.prev', ->
        if !loading
          next = (point - 1) % all
          loading = true

          play cur, photoset.eq(next), ->
            photoset.eq(point).animate opacity: 0, 500
            loading = false
            point = next
            return
        return
      ).on 'click', '.next', ->
        if !loading
          next = (point + 1) % all
          loading = true
          play cur, photoset.eq(next), ->
            photoset.eq(cur).animate opacity: 0, 500
            loading = false
            point = next
            return
        return
    else
      $('.control').hide()
    return
  return
) jQuery