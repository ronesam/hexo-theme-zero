# Zero

> 类书籍化的hexo主题。

> A hexo theme base on jade and stylus like a book. Designed by [hexo-theme-modernist].

[Demo the Theme]

## Install

```
npm install hexo-renderer-jade --save
git clone git://github.com/ronesam/hexo-theme-zero.git themes/zero
```

**zero requires Hexo 2.4 and above.**

## Enable
Modify `theme` setting in `_config.yml` to `zero`.

## Update

```
cd themes/zero
git pull
```

## Modified
### 2.3.0
* 全屏代码更换

### 2.2.0
* script分离，按需加载

### 2.1.0
* 新增summary布局

### 2.0.0
#### 结构调整
* 将`ejs`模板替换成我喜欢的jade

### 1.0.0
#### 样式调整
* 网站的配色很不错，但实在太窄了，根据多年的习惯，把网页的默认宽度由：680px -> 760px
* 调整签名栏宽度为240px，可以多增加一些菜单
* 调整blockquote的上下留白，统一为15px（原谅我可悲的像素眼和强迫症……）
* 调整blockquote的尾注，移到右侧并取消顶部线条，下边距增加到14px

#### 性能优化
* 由于众所周知的原因，将一些静态资源迁移到国内的公共CDN：[Bootcdn]、[360cdn]
    * jquery升级：1.8.0 -> 2.1.4
    * imagesload升级: 未知 -> 2.1.0（未采用更高版本，因需要另外引入EventEmitter）
    * fancybox：2.1.1 -> 2.1.5，并删除本地目录
    * font-awesome：未知 -> 4.4.0，并删除本地目录（没有直接用到css文件，而是仅引入了字体）
    * 将`fonts.googleapis.com`中的涉及到样式合并到本地（但字体文件本身还是用的[360cdn]）
    * 将gallery.js（用于展示顶部相册，并给图片打标）和scale.fit.js（移动设备按比例缩放）合并为hexo-theme-zero.js
    * 将css、js、img目录统一迁移到static，并将static同步到七牛

#### 功能调整
* 去掉head.ejs中description是否存在的相关判断和操作，open_graph()函数中已有包含
* 增加theme里面关于cdn的配置
* 增加右侧边栏，包含`回到顶部、全屏、目录、评论；上一篇、下一篇`等按钮
* 增加点击全屏功能，基于`[jquery.fullscreen.js]`，并调整代码使其支持`回到顶部`按钮
* 增加回到顶部功能（普通模式&全屏模式均支持）

## Configuration

``` yaml
# Header
menu:
  Home: /
  Archives: /archives
rss: /atom.xml

# Content
archive_date_format: MMM DD
fancybox: true

# Comment Plugin
duoshuo_shortname:

# Miscellaneous
google_analytics:
favicon: /favicon.ico
```

- **menu** - Navigation menu
- **rss** - RSS link
- **archive_date_format** - Date format in archives page.
- **fancybox** - Enable [Fancybox]
- **duoshuo_shortname** - [Duoshuo] ID
- **google_analytics** - Google Analytics ID
- **favicon** - Favicon path

## 参考资料：
0. [Hexo你的博客][hexou]
0. [Hexo 优化与定制(一) ][1]
0. [Hexo 优化与定制(二) ][2]
0. [hexo-qiniu-sync]

[hexou]: http://ibruce.info/2013/11/22/hexo-your-blog/
[Bootcdn]: http://www.bootcdn.cn/
[360cdn]: http://libs.useso.com/
[1]: http://lukang.me/2014/optimization-of-hexo.html
[2]: http://lukang.me/2015/optimization-of-hexo-2.html
[Hexo]: http://zespia.tw/hexo/
[hexo-theme-modernist]: http://modernist.heroicyang.com/
[hexo-qiniu-sync]: https://github.com/gyk001/hexo-qiniu-sync
[jquery.fullscreen.js]: https://github.com/martinaglv/jQuery-FullScreen/blob/master/fullscreen/jquery.fullscreen.js
[Demo the Theme]: http://ronesam.com/
[Duoshuo]: http://duoshuo.com/
[Fancybox]: http://fancyapps.com/fancybox/