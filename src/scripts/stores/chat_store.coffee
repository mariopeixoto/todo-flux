'use strict';

Summer = require '../summer/summer'
AppDispatcher = require '../dispatcher/app_dispatcher'

EventEmitter = require('events').EventEmitter
ChatActions = require '../actions/chat_actions'

_messages = []

ChatStore = Summer.createStore EventEmitter, {
  getMessages: () ->
    _messages

  addChangeListener: (callback) ->
    @on('change', callback)

  removeChangeListener: (callback) ->
    @removeListener('change', callback)
}

module.exports = ChatStore

#Private
ChatStoreHandler = Summer.createStoreHandler
  listenTo: ChatActions.listenables

  onAddMessage: (message) ->
    console.log "on Add Message #{message}"
    _messages.push(message)
    ChatStore.emit('change')


AppDispatcher.register ChatStoreHandler.dispatchCallback()