# grunt-svn

> A Grunt.js plugin that provides easy access to Subversion working copy metadata (svn info).

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-svn --save-dev
```

One the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-svn');
```

## The "svninfo" task

### Overview
In your project's Gruntfile, add a section named `svninfo` to the data object passed into `grunt.initConfig()`.
Executing the task `svninfo` would run `svn info` in the command line and would make the retrieved data available via grunt.config (e.g. `<%= svninfo.rev %>`) in your build.

```js
grunt.initConfig({
  svn: { }
  },
})
```

### Usage Examples

#### Default Options

```js
grunt.initConfig({
  svn: { }
  },
})
```

```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History
_(Nothing yet)_
