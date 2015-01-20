'use strict';

Summer = require '../summer/summer'
AppDispatcher = require '../dispatcher/app_dispatcher'

EventEmitter = require('events').EventEmitter
Chat2Actions = require '../actions/chat2_actions'

_messages = []

Chat2Store = Summer.createStore EventEmitter, {
  getMessages: () ->
    _messages

  addChangeListener: (callback) ->
    @on('change', callback)

  removeChangeListener: (callback) ->
    @removeListener('change', callback)
}

module.exports = Chat2Store

#Private
Chat2StoreHandler = Summer.createStoreHandler
  listenTo: Chat2Actions.listenables

  onAddMessage: (message) ->
    console.log "on Add Message 2 #{message}"
    _messages.push(message)
    Chat2Store.emit('change')


AppDispatcher.register Chat2StoreHandler.dispatchCallback()