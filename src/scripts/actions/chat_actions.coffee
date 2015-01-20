'use strict';

AppDispatcher = require '../dispatcher/app_dispatcher'
Summer = require '../summer/summer'

ChatActions = Summer.createActions 'Chat', AppDispatcher, ['addMessage']

module.exports = ChatActions