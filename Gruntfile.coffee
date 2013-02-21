#
# * grunt-svninfo
# * https://github.com/liqweed/grunt-svninfo
# *
# * Copyright (c) 2013 liqweed
# * Licensed under the MIT license.
#
"use strict"
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ["tmp"]

    # Unit tests.
    nodeunit:
      tests: ["test/*_test.js"]

    coffeelint:
      app: ['Gruntfile.coffee','tasks/*.coffee', 'test/*.coffee']
      options:
        'no_trailing_whitespace':
          'level': 'error'
        'max_line_length':
          value: 100,
          level: "warn"

  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask "test", ["clean", "svninfo", "nodeunit"]

  # By default, lint and run all tests.
  grunt.registerTask "default", ["coffeelint"]