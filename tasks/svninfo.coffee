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
  grunt.registerTask 'svninfo','Get Subversion info from a working copy and populate grunt.config with the data', (output, argsKey) ->
    done = @async()
    options = @options
      cwd: '.'
      output: 'svninfo'
    options.output = output if output
    args = options[argsKey or 'args']
    
    grunt.verbose.writeln("svninfo start: output - ", options.output, ", args - ", args)
    
    grunt.util.spawn
      cmd: 'svn'
      args: if args then ['info', '--xml'].concat(args) else ['info', '--xml']
      opts: options
    , (err, result) ->
      if err
        grunt.log.warn err
        return done()
      info = {}
          
      # Extract xml info with RegExp
      revRE = /<entry[^>]+revision="([^"]*)"/
      urlRE = /<url>([^<]*)<\/url>/
      lastRevRE = /<commit[^>]+revision="([^"]*)"/
      lastAuthorRE = /<author>([^<]*)<\/author>/
      lastDateRE = /<date>([^<]*)<\/date>/
      repoRootRE = /<root>([^<]*)<\/root>/
      repoIdRE = /<uuid>([^<]*)<\/uuid>/

      # Populate grunt.config with nicely parsed object:
      grunt.config.set options.output,
        rev: revRE.exec(result.stdout)[1]
        url: urlRE.exec(result.stdout)[1]
        last:
          rev: lastRevRE.exec(result.stdout)[1]
          author: lastAuthorRE.exec(result.stdout)[1]
          date: lastDateRE.exec(result.stdout)[1]
        repository:
          root: repoRootRE.exec(result.stdout)[1]
          id: repoIdRE.exec(result.stdout)[1]

      grunt.log.writeln "SVN info fetched (rev: #{grunt.config.get(options.output + '.rev')})"
      done()
