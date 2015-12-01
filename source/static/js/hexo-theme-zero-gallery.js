(function($){
  var play = function(parent, item, callback){
    var width = parent.width();

    item.imagesLoaded(function(){
      var _this = this[0],
        nWidth = _this.naturalWidth,
        nHeight = _this.naturalHeight;

      callback();
      this.animate({opacity: 1}, 500);
      parent.animate({height: width * nHeight / nWidth}, 500);
    });
  };

  $('.gallery').each(function(){
    var $this = $(this),
      current = 0,
      photoset = $this.children('.photoset').children(),
      all = photoset.length,
      loading = true;

    play($this, photoset.eq(0), function(){
      loading = false;
    });

    if(all > 1) {
      $this.on('click', '.prev', function(){
        if (!loading){
          var next = (current - 1) % all;
          loading = true;

          play($this, photoset.eq(next), function(){
            photoset.eq(current).animate({opacity: 0}, 500);
            loading = false;
            current = next;
          });
        }
      }).on('click', '.next', function(){
        if (!loading){
          var next = (current + 1) % all;
          loading = true;

          play($this, photoset.eq(next), function(){
            photoset.eq(current).animate({opacity: 0}, 500);
            loading = false;
            current = next;
          });
        }
      });
    } else {
      $('.control').hide();
    }

  });
})(jQuery);