var grunt = require('grunt');

/*
  ======== A Handy Little Nodeunit Reference ========
  https://github.com/caolan/nodeunit

  Test methods:
    test.expect(numAssertions)
    test.done()
  Test assertions:
    test.ok(value, [message])
    test.equal(actual, expected, [message])
    test.notEqual(actual, expected, [message])
    test.deepEqual(actual, expected, [message])
    test.notDeepEqual(actual, expected, [message])
    test.strictEqual(actual, expected, [message])
    test.notStrictEqual(actual, expected, [message])
    test.throws(block, [error], [message])
    test.doesNotThrow(block, [error], [message])
    test.ifError(value)
*/

exports['svn'] = {
  setUp: function(done) {
    done();
  },
  'parse_svninfo_helper': function(test) {
    test.expect(1);
	var svnInfoAsString = "Path: .\n" + 
	"Working Copy Root Path: C:/workspace/grunt-svn\n" +
	"URL: https://myDomain.com/svn/repo/project/trunk\n" + 
	"Repository Root: https://myDomain.com/svn/repo\n" + 
	"Repository UUID: 5b81218e-5263-406a-8320-3836ee58259e\n" + 
	"Revision: 4472\n" + 
	"Node Kind: directory\n" + 
	"Schedule: normal\n" + 
	"Last Changed Author: ophir\n" + 
	"Last Changed Rev: 4402\n" + 
	"Last Changed Date: 2012-09-05 12:52:12 +0300";
	var svnInfo = grunt.helper('parse_svninfo', svnInfoAsString);
    test.equal(svnInfo.Revision, 4472, 'should return the correct revision.');
    test.done();
  }
};
