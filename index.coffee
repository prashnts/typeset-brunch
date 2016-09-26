'use strict'


class Typeset
  brunchPlugin: yes
  type: 'template'
  extension: 'html'

  constructor: (config) ->
    @config = Object.assign @defaultOpts, config.plugins.typeset

  defaultOpts:
    disable: 'ligatures'

  optimize: (file) ->
    {data, path, map = null} = file



module.exports = Typeset
