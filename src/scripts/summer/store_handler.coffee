'use strict';

_ = require './utils'

class StoreHandlerBase
  dispatchCallback: () ->
    callbackMap = {}
    self = @
    @listenTo.actions.forEach (name) ->
      callbackMap[name] = self["on#{_.capitalize(name)}"]

    callback = (action) -> 
      if action.actionNamespace == self.listenTo.namespace
        callbackMap[action.actionType](action.payload)

    callback

createStoreHandler = (spec) ->
  StoreHandler = () ->
    @

  _.extend StoreHandler.prototype, StoreHandlerBase.prototype, spec

module.exports = createStoreHandler