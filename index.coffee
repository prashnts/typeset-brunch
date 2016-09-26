'use strict'
fs = require 'fs'
glob = require 'glob'
typeset = require 'typeset'


class Typeset
  brunchPlugin: yes
  type: 'template'
  extension: 'html'

  constructor: (config) ->
    defaults =
      pattern: "#{config.paths?.public}/**/*.html"
    @config = Object.assign defaults, config.plugins.typeset

  onCompile: ->
    files = glob.sync @config.pattern
    files.map (fname) =>
      content = fs.readFileSync fname, 'utf-8'
      transformed = typeset content, @config.tweaks
      fs.writeFileSync fname, transformed
    console.log "typeset: post-processed #{files.length} files"


module.exports = Typeset
