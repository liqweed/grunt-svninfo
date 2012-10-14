/*
 * grunt-svn
 * https://github.com/liqweed/grunt-svn
 *
 * Copyright (c) 2012 Ophir
 * Licensed under the MIT license.
 */

module.exports = function(grunt) {

  // Please see the grunt documentation for more information regarding task and
  // helper creation: https://github.com/gruntjs/grunt/blob/master/docs/toc.md

  // ==========================================================================
  // TASKS
  // ==========================================================================

  grunt.registerTask('svn_info', 'Your task description goes here.', function() {
    grunt.log.writeln("Extracting SVN info...");
	var done = this.async();
	grunt.utils.spawn({
		cmd: 'svn',
		args: ['info']
	}, function(err, result) {
		if (err) {
			grunt.log.error(err);
			return done(false);
		}
		var svnInfo = parse_svninfo(result);
		grunt.config.set('svnInfo', svnInfo);
		grunt.config.set('revision', svnInfo['Revision']);
		grunt.log.writeln("SVN revision: " + svnInfo['Revision']);
		done();
	});
  });

	var parse_svninfo = function(svnInfoAsString) {
		var svnInfo = {};
		var infoLines = svnInfoAsString.split('\n');
		for (var i = 0; i< infoLines.length; i++) {
			var parsedLine = infoLines[i].split(': ', 2);
			svnInfo[parsedLine[0]] = parsedLine[1];
		}
		return svnInfo;
	};
};
