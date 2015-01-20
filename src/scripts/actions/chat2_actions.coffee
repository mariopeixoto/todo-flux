'use strict';

AppDispatcher = require '../dispatcher/app_dispatcher'
Summer = require '../summer/summer'

Chat2Actions = Summer.createActions 'Chat2', AppDispatcher, ['addMessage']

module.exports = Chat2Actions