gulp = require 'gulp'
concat = require 'gulp-concat'
wrap = require 'gulp-wrap-exports'
path = 'source/static/js/'
task 'sbuild', 'Prepare project for distribution.', ->
  gulp.task 'regexper', ->
    return gulp.src(path + '_coffee/_regexper/*.js')    
    .pipe(concat('regexper.js'))
    .pipe(wrap({name: 'regexper'}))
    .pipe(gulp.dest(path))

  gulp.start 'regexper'
  return