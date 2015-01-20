'use strict';

_ = require './utils'

createStore = (EventEmitter, spec) ->
  Store = () ->
    @

  _.extend Store.prototype, EventEmitter.prototype, spec

module.exports = createStore