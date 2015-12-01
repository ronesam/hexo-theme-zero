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
    //全屏是个异步API，所以增加了状态改变后的回调
    screenfull.toggle('', function(isFullscreen) {
      if(!isFullscreen) {
        icon_full.attr('title', '全屏').addClass('icon-fullscreen').removeClass('icon-screenshot');
      } else {
        icon_full.attr('title', '取消全屏').addClass('icon-screenshot').removeClass('icon-fullscreen');
      }
    })    
  });

  //No.3 目录
  $(document).on('opening', '[data-remodal-id=summary]', function () {
    var arr_path = window.location.pathname.split('/');
    var summary_path = arr_path[1];
    var url = '//' + window.location.host + '/' + summary_path + '/summary/index.json';
    $.getJSON(url, function(json) {
      //倒数第二个才是文件名
      var file_name = decodeURI(arr_path[arr_path.length - 2])
      //当前文件标红
      var summary = json.summary.replace('>' + file_name + '<', '><span style="color:orange">' + file_name + '</span><');
      $('article.summary').html(summary);
    })
  });

  //No.4 评论
  $(document).on('opening', '[data-remodal-id=comment]', function () {    
    var ds = document.createElement('script');
    ds.type = 'text/javascript';
    ds.async = true;
    ds.src = '//static.duoshuo.com/embed.js';
    ds.charset = 'UTF-8';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
  });
});

/*!
* screenfull
* v2.1.0 - 2015-11-30
* v2.0.0 - 2014-12-22
* (c) Sindre Sorhus; MIT License
*/
(function () {
  'use strict';

  var isCommonjs = typeof module !== 'undefined' && module.exports;
  var keyboardAllowed = typeof Element !== 'undefined' && 'ALLOW_KEYBOARD_INPUT' in Element;

  var fn = (function () {
    var val;
    var valLength;

    var fnMap = [
      [
        'requestFullscreen',
        'exitFullscreen',
        'fullscreenElement',
        'fullscreenEnabled',
        'fullscreenchange',
        'fullscreenerror'
      ],
      // new WebKit
      [
        'webkitRequestFullscreen',
        'webkitExitFullscreen',
        'webkitFullscreenElement',
        'webkitFullscreenEnabled',
        'webkitfullscreenchange',
        'webkitfullscreenerror'

      ],
      // old WebKit (Safari 5.1)
      [
        'webkitRequestFullScreen',
        'webkitCancelFullScreen',
        'webkitCurrentFullScreenElement',
        'webkitCancelFullScreen',
        'webkitfullscreenchange',
        'webkitfullscreenerror'

      ],
      [
        'mozRequestFullScreen',
        'mozCancelFullScreen',
        'mozFullScreenElement',
        'mozFullScreenEnabled',
        'mozfullscreenchange',
        'mozfullscreenerror'
      ],
      [
        'msRequestFullscreen',
        'msExitFullscreen',
        'msFullscreenElement',
        'msFullscreenEnabled',
        'MSFullscreenChange',
        'MSFullscreenError'
      ]
    ];

    var i = 0;
    var l = fnMap.length;
    var ret = {};

    for (; i < l; i++) {
      val = fnMap[i];
      if (val && val[1] in document) {
        for (i = 0, valLength = val.length; i < valLength; i++) {
          ret[fnMap[0][i]] = val[i];
        }
        return ret;
      }
    }

    return false;
  })();

  var screenfull = {
    request: function (elem) {
      var request = fn.requestFullscreen;

      elem = elem || document.documentElement;

      // Work around Safari 5.1 bug: reports support for
      // keyboard in fullscreen even though it doesn't.
      // Browser sniffing, since the alternative with
      // setTimeout is even worse.
      if (/5\.1[\.\d]* Safari/.test(navigator.userAgent)) {
        elem[request]();
      } else {
        elem[request](keyboardAllowed && Element.ALLOW_KEYBOARD_INPUT);
      }
    },
    exit: function () {
      document[fn.exitFullscreen]();
    },
    toggle: function (elem, fn) {
      if (this.isFullscreen) {
        this.exit();
        fn(false);
      } else {
        this.request(elem);
        fn(true);
      }
    },
    raw: fn
  };

  if (!fn) {
    if (isCommonjs) {
      module.exports = false;
    } else {
      window.screenfull = false;
    }

    return;
  }

  Object.defineProperties(screenfull, {
    isFullscreen: {
      get: function () {
        return !!document[fn.fullscreenElement];
      }
    },
    element: {
      enumerable: true,
      get: function () {
        return document[fn.fullscreenElement];
      }
    },
    enabled: {
      enumerable: true,
      get: function () {
        // Coerce to boolean in case of old WebKit
        return !!document[fn.fullscreenEnabled];
      }
    }
  });

  if (isCommonjs) {
    module.exports = screenfull;
  } else {
    window.screenfull = screenfull;
  }
})();