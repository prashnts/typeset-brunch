'use strict'
{expect} = require 'chai'
Typeset = require '../'

describe 'Typeset', ->
  plugin = null

  beforeEach -> plugin = new Typeset plugins: {}

  it 'is an object', ->
    expect(plugin).to.be.an 'object'

  it 'has #optimize method', ->
    expect(plugin).to.respondTo 'optimize'

