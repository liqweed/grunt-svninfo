# grunt-svninfo [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

> A Grunt.js plugin that provides easy access to Subversion working copy metadata (svn info).

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-svninfo --save-dev
```

One the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-svninfo');
```

That's about it, no configuration necessary.

## The "svninfo" task

### Overview
In your project's Gruntfile, add a section named `svninfo` to the data object passed into `grunt.initConfig()`.
Executing the task `svninfo` would run `svn info` in the command line and would make the retrieved data available via grunt.config (e.g. `<%= svninfo.rev %>`) in your build.
The resulting `svninfo` object has the following structure:


```js
{
  "rev": "321",
  "url": "https://yourproject.unfuddle.com/svn/repo/trunk",
  "last": {
 	  "rev": "321",
 	  "author": "me",
 	  "date": "2013-02-10 12:35:30 +0200"
  },
  "repository": {
 	  "root": "https://yourproject.unfuddle.com/svn/repo",
 	  "id": "f5d41312-1fa6-4ca6-a93e-e27d7e98fc43"
  }
}
```

### Options

#### cwd
Type: `String`

Allows to specify a cwd (current working directory) path for the SVN repository of which to retrieve the information. The default directory is the where you run grunt from (`'.'`).

Example:
``` js
svninfo: {
  options: {
    cwd: './myproject/ishere'
  },
  ...
}
```

#### output
Type: `String`

Allows to specify a custom object that would contain the retrieved and parsed SVN info. Defaults to 'svninfo'. This feature came about to support projects with multiple external dependencies ("extenals"), in which each external would have its own info object instead of having them override each other with each 'info' call.

Name of object can be redefined or specified by the first argument of task (see below).

Example:
``` js
svninfo: {
  options: {
    output: 'myExternal_svninfo'
  },
  ...
}
```

#### args
Type: `Array`

Allows to specify options for `svn info` command (e.g. target, username, password etc).

Example:
``` js
svninfo: {
  options: {
    args: ['http://some.svn-server.net/repo/project/trunk', '--username', 'name', '--password', 'pass']
  },
  ...
}
```

It is possible to retrieve command options from other option instead of `args`.
It can be done by using the second argument of task (see below).

### Task arguments

Two arguments can be passed to the task:

1. Allows to specify a custom object that would contain the retrieved and parsed SVN info. This argument has priority over the `output` option.
2. Allows to specify name of options field that contains list of command options. This argument has priority over the `args` option.

Example: 
``` js
grunt.initConfig({
  svninfo: {
    options: {
      abcArgs: ['http://some.svn-server.net/repo/abc/trunk', '--username', 'name', '--password', 'pass']
    },
    ...
  }
...
grunt.registerTask("abcInfo", ["svninfo:abc:abcArgs"]);
// or `grunt svninfo:abc:abcArgs` from command line
});
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
 * 0.1.5 - Using svninfo XML output for better localization support - thanks to [@dabos-GFI](https://github.com/dabos-GFI)
 * 0.1.4 - Support for task arguments and args option - thanks to [@gamtiq](https://github.com/gamtiq)
 * 0.1.3 - Support for a custom name for the info object - thanks to [@solomojb](https://github.com/solomojb)
 * 0.1.2 - Support for 'cwd' option - thanks to [@richmarr](https://github.com/richmarr)
 * 0.1.1 - Grunt 0.4.x compatibility
 * 0.1.0 - Initial release
