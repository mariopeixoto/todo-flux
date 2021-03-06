'use strict';

createActions = (namespace, Dispatcher, actions) ->
  Actions = () ->
    @

  Actions.prototype.listenables = {
    namespace: namespace
    actions: actions
  }

  for action in actions
    Actions.prototype[actions] = (payload) ->
      Dispatcher.dispatch {
        actionNamespace: namespace
        actionType: action
        payload: payload
      } 

  new Actions()

module.exports = createActions