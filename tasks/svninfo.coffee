#
# * grunt-svninfo
# * https://github.com/liqweed/grunt-svninfo
# *
# * Copyright (c) 2013 liqweed
# * Licensed under the MIT license.
#
# 
# require("child_process").spawn("svn",["info"],{cwd:"./test/fixtures/svninfo"}).stdout.on('data',function(data){ console.log(data.toString()); });

"use strict"
module.exports = (grunt) ->

  # Please see the Grunt documentation for more information regarding task
  # creation: http://gruntjs.com/creating-tasks
  grunt.registerTask 'svninfo', 'Get Subversion info from a working copy and populate grunt.config with the data', ->
    done = @async()
    options = @options
      cwd: '.'
    
    grunt.util.spawn
      cmd: 'svn'
      args: ['info']
      opts: options
    , (err, result) ->
      if err
        grunt.log.warn err
        return done()
      info = {}
      # Split SVN info by lines:
      result.stdout.split('\n').forEach (line) ->
        lineParts =line.split(': ')
        if lineParts.length == 2
          # Populate info object
          info[lineParts[0]] = lineParts[1].trim()

      # Populate grunt.config with nicely parsed object:
      grunt.config.set 'svninfo',
        rev: info['Revision']
        url: info['URL']
        last:
          rev: info['Last Changed Rev']
          author: info['Last Changed Author']
          date: info['Last Changed Date']
        repository:
          root: info['Repository Root']
          id: info['Repository UUID']

      grunt.log.writeln "SVN info fetched (rev: #{grunt.config.get('svninfo.rev')})"
      done()
