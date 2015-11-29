//右侧边栏相关代码
$(function() {
  //No.1 回到顶部
  var icon_up = $('.icon-arrow-up');
  icon_up.click(function() {
    $('html, body, .fullscreen').animate({scrollTop: 0}, 1000);
  });

  var showArrow = function(top) {
    if (top > 1000) {
      icon_up.show();
    } else {
      icon_up.hide();
    }
  };

  $(window).scroll(function() {
    showArrow($(this).scrollTop());
  });

  //No.2 全屏/取消全屏
  var icon_full = $('.icon-fullscreen');
  icon_full.click(function(e) {
    $('.wrapper').fullScreen({
      'callback': function(fullscreen){
        if(!fullscreen) {
          icon_full.attr('title', '全屏').addClass('icon-fullscreen').removeClass('icon-screenshot');
        } else {
          icon_full.attr('title', '取消全屏').addClass('icon-screenshot').removeClass('icon-fullscreen');
          //只有全屏化之后才会有.fullscreen，所以每次点击都要重新绑定
          $('.fullscreen').scroll(function () {
            showArrow($(this).scrollTop());
          });
        }
      }
    })
  })
})