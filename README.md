![Demo](http://i.imgur.com/adsiz94.gif)

`typeset-brunch` is [Brunch](http://brunch.io) interface for [Typeset](https://github.com/davidmerfield/Typeset), an html preprocessor for web typography.

[![Build Status](https://travis-ci.org/prashnts/typeset-brunch.svg?branch=master)](https://travis-ci.org/prashnts/typeset-brunch)
[![Test Coverage](https://codeclimate.com/github/prashnts/typeset-brunch/badges/coverage.svg)](https://codeclimate.com/github/prashnts/typeset-brunch/coverage)
[![Greenkeeper badge](https://badges.greenkeeper.io/prashnts/typeset-brunch.svg)](https://greenkeeper.io/)

[![NPM](https://nodei.co/npm/typeset-brunch.png?mini=true)](https://nodei.co/npm/typeset-brunch/)

## Usage
Install the plugin via `npm` with:

```shell
npm install typeset-brunch --save
```

You will also need to add `typeset.css` to your project (see configuration).

## Configuration
By default, this plugin will look for html files in the `public` directory from brunch configuration. This behaviour can be changed by adding a custom `glob` pattern in brunch configuration. `Typeset` configurations can be issued from a `tweaks` property. A typical configuration looks like this:

```coffee
config = 
  plugins:
    typeset:
      pattern: 'public/**/*.html'
      tweaks:
        disable: ['ligatures']

```

**Typeset CSS**: Customise and add the following CSS to your project:

```css
/* Small caps */
.small-caps {font-family: 'Charter SC', serif}

/* Double quote (") marks */
.pull-double{margin-left:-.38em}
.push-double{margin-right:.38em}

/* Single quote (') marks */
.pull-single{margin-left:-.15em}
.push-single{margin-right:.15em}

/* Optical margin alignment for particular letters */
.pull-T, .pull-V, .pull-W, .pull-Y {margin-left: -0.07em}
.push-T, .push-V, .push-W, .push-Y {margin-right: 0.07em}

.pull-O, .pull-C, .pull-o, .pull-c {margin-left: -0.04em}
.push-O, .push-C, .push-o, .push-c {margin-right: 0.04em}

.pull-A {margin-left: -0.03em}
.push-A {margin-right: 0.03em}
```

- [on npm](https://www.npmjs.com/package/closure-compiler-brunch)
- [on github](https://github.com/prashnts/closure-compiler-brunch)


## Footnotes

Due to the way Brunch works, there's no pretty way to add a post-process hook. This plugin leverages the `onCompile` hook to process the html files. It should work fine for most use cases. Should this raise weird bugs or slowdowns, please help with a PR or an issue.

## License

The MIT License (MIT)
