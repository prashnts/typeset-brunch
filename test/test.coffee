'use strict'
mockfs = require 'mock-fs'
fs = require 'fs'
{expect} = require 'chai'
Typeset = require '../'


describe 'Typeset', ->
  plugin = null

  beforeEach -> plugin = new Typeset
    paths: public: 'public'
    plugins: {}

  it 'is an object', ->
    expect(plugin).to.be.an 'object'

  it 'has #onCompile method', ->
    expect(plugin).to.respondTo 'onCompile'

  describe '#onCompile', ->
    beforeEach -> mockfs
      'public/index.html': '<p>"Hello," said the fox.</p>'
      'public/foo/bar/baz.html': '<p>"Hello, Mr Fox."</p>'
      'should/not/process/this.html': '<p>Hello, "Mr" Fox.</p>'
    afterEach -> mockfs.restore()

    it 'transforms HTML content', ->
      plugin.onCompile()
      fs.readFile 'public/index.html', 'utf-8', (_, dat) ->
        expect(dat).to.equal '<p><span class="pull-double">“</span>Hello,” said the fox.</p>' # noqa
      fs.readFile 'public/foo/bar/baz.html', 'utf-8', (_, dat) ->
        expect(dat).to.equal '<p><span class="pull-double">“</span>Hello, Mr Fox.”</p>' # noqa
      fs.readFile 'should/not/process/this.html', 'utf-8', (_, dat) ->
        expect(dat).to.equal '<p>Hello, "Mr" Fox.</p>'

    it 'applies supplied params', ->
      plug = new Typeset
        paths: public: 'should'
        plugins: {}

      plug.onCompile()
      fs.readFile 'should/not/process/this.html', 'utf-8', (_, dat) ->
        expect(dat).to.equal '<p>Hello,<span class="push-double"></span> <span class="pull-double">“</span>Mr” Fox.</p>' # noqa
